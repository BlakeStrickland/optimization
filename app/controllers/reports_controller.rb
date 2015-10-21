class ReportsController < ApplicationController
  helper_method :memory_in_mb

  def search

  end

  def all_data
    @start_time = Time.now

    @sequences = []
    @genes = []
    @hits = []
    @assembly = Assembly.find_by_name(params[:name])
    @assembly.sequences.each do |s|
      @sequences << s
      s.genes.each do |g|
        @genes << g
        g.hits.each do |h|
          @hits << h
        end
      end
    end
    # @hits = Hit.includes(gene: {sequence: :assembly}).where("percent_similarity LIKE ? OR genes.dna LIKE ? OR sequences.dna LIKE ? OR assemblies.name LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%")

    @hits.sort! {|a, b| b.percent_similarity <=> a.percent_similarity}

    @memory_used = memory_in_mb
  end

  private def memory_in_mb
    `ps -o rss -p #{$$}`.strip.split.last.to_i / 1024
  end
end
