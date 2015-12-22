aggregate(df$var, by=list(df.emp$group), FUN=min)
aggregate(df$var, by=list(df.emp$group), FUN=max)
aggregate(df$var, by=list(df.emp$group), FUN=mean)