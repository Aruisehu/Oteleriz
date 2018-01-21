module NavLinkHelper
    def nav_link(name, path)
        return link_to name, path, class: nav_active(path) ? "active" : ""
    end

    def nav_active(path)
        return request.env['PATH_INFO'] == path
    end
end
