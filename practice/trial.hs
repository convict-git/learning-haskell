takeme n xs | n > 0 = case xs of (u : us) -> u : takeme (n - 1) us
                                        _ -> []
            | otherwise = []
