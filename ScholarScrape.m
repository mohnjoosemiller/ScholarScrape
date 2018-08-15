clear all
st = inputdlg({'What is your query?'});
pgs = inputdlg({'how many pages of results to query?'});
inc_cit = listdlg("ListString", {'yes','no'},"PromptString",'Do you want to include citations?')-1;
inc_pat = listdlg("ListString", {'yes','no'},"PromptString",'Do you want to include patents?')-1;
date_beg = inputdlg({'Start Date of Query?'});
date_end = inputdlg({'End Date of Query?'});

c=1

for p = 1:pgs{1}
  p=p-1
  url = ['https://scholar.google.com/scholar?hl=en&as_ylo=',num2str(date_beg{1}),'&as_yhi=',num2str(date_end{1}),'&as_sdt=',num2str(inc_pat),'&as_vis=',num2str(inc_cit),'%2C44&q=filetype%3Apdf+',st{1},'&start=',num2str(p*10)];
  a = urlread(url);
  URLS = unique(regexp(a,'(http|ftp|https)://([\w_-]+(?:(?:\.[\w_-]+)+))([\w.,@?^=%&:/~+#-]*[\w@?^=%&/~+#-])','match'));
  for i = 1:length(URLS)
    b=1
    if isempty(findstr(URLS{i},"google"))
      try
        urlwrite(URLS{i},sprintf('%f.pdf',c))
        c=c+1
      catch
      end_try_catch
    endif
  endfor
  clear URLS
endfor
