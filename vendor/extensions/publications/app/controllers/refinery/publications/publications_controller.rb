module Refinery
  module Publications
    class PublicationsController < ::ApplicationController

      before_filter :find_all_publications
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @publication in the line below:
        @years = @publications.map(&:year).uniq
        if params[:year]
          @publications = @publications.where(year: params[:year])
        else
          @publications = Publication.order('year DESC')
        end

        @publications = @publications.order('title ASC')

        present(@page)
      end

      def show
        @publication = Publication.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @publication in the line below:
        present(@page)
      end

    protected

      def find_all_publications
        @publications = Publication.order('year DESC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/publications").first
      end

    end
  end
end
