module PaginationHelper
    class Pagination
        initialize(rate)
            @count = Article.all.size
        end
    end
end
