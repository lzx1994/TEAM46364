function data=dbquery(query)
    if size(query,1)==0
        return
    end
    conn=database('CollegeData','','');
    ping(conn);
    querystr=query(1,:);
    for i=2:size(query,1)
       querystr=sprintf('%s,%s',querystr,query(i,:));
    end
    command=sprintf('SELECT %s FROM COLLEGES order by UNITID asc',querystr);
    
    data=fetch(conn,command);
    
    close(conn);