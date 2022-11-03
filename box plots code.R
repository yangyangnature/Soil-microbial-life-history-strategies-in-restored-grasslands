pacman::p_load(tidyverse, rio)

dat <- rio::import('fig3data.xls')

dat %>% 
  
  mutate(index_full_name = factor(index_full_name, 
                                  
                                  levels = dat$index_full_name %>% unique())) %>%
  
  gather(key = 'year', value = 'value', yr1:yr30) %>%
  
  ggplot(aes(x = year, y = value, fill = year)) +
  
  facet_wrap(~index_full_name, scales = 'free_y')+
  
  geom_boxplot(outlier.shape = NA, show.legend = FALSE)+
  
  labs(x = '', y = '')
