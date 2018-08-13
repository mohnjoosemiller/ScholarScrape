clear all
st = input('What is your query?')


c=1
pgs = input('how many pages of results to query?')
for p = 1:pgs
  p=p-1
  url = ['https://scholar.google.com/scholar?hl=en&as_sdt=0%2C44&q=filetype%3Apdf+',st,'&start=',num2str(p*10)];
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
