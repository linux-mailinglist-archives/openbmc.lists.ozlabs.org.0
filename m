Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA11FA63357
	for <lists+openbmc@lfdr.de>; Sun, 16 Mar 2025 03:22:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZFhgm2tB4z3cC5
	for <lists+openbmc@lfdr.de>; Sun, 16 Mar 2025 13:21:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742091712;
	cv=none; b=af/qz73hSOdMAKnFoL4QiKdUhxKHooepT5owZR2Qw0dGGb4KvUn24P4HwTM/M5F7oWgGg52N6abDZcwy72aQyR7wOMYHgPhhk9YIzfpflwqi/b/QrcY6DTvkIOvqN3AryMvBxBstVxlRZa52ojOlj8e0YieAyrkHuSKHv5iCaq0WI7y3KkCT6JCMBogbKY1Wd7Gyqg529ad374J5EtrQSpB4ugftlA4Vhw7W/EMkOo5bZWcsQnX0a5LI8GF8e7IS+vAv3NJ1f4FXZ5RWR1wVqSUM2QK9zdtnKZLquekk+2HN96o7aqsSRNFKwzHNdKmcTi4oHlaJvDWuGjuxETGM5g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742091712; c=relaxed/relaxed;
	bh=xXQAPce9+Da2Thb7jFtKZNkgNkWHZYB4UCuGYADpkwQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eOJ9CLb4HgN425r2/GDxj2ASg3InCB79uhBqBdecrvOR6JQExSEhco8V8xtWXu398/0q+7pgexy/2U0jXub91Aroz1dsvAwfP1JY5G+XGb/x+JGPRzXrDSqQTf30TtbjQ2ApJkGigF7rEDrR/TLHZ3t4WMrnx5mZuriclulzSMebP63AAjdJqflDCWvwZ9w22K8M8KqMXXKaZZacawCMCquKgTchToCjv8VPESO4SzYUr2Ccn6y6aq2mMeKTuz7vSP20/4t/xy52C3kzg4czFPgr9eZPRrx3dtWrROG+bDywYDu62wwwebulFlD/5veqSnAt7XSSIy0T9WlLyzq9SQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OLOAfPSh; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OLOAfPSh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZFhgf6c01z2yRl
	for <openbmc@lists.ozlabs.org>; Sun, 16 Mar 2025 13:21:49 +1100 (AEDT)
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-3014ae35534so1079620a91.0
        for <openbmc@lists.ozlabs.org>; Sat, 15 Mar 2025 19:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742091707; x=1742696507; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=xXQAPce9+Da2Thb7jFtKZNkgNkWHZYB4UCuGYADpkwQ=;
        b=OLOAfPSh+zrKWemu5cW+XGPuTDnY+rs2COmTNWMJcV4iqEna5+x0ZIekM1Awsy1cS4
         Ou9U0HemZs6RO57sV77lgodYnyT6AsQZic/+P7O7bqcP1lQQ15/800OEB9Yblxwk1/BC
         ct2ZeM+2Rv/iEPbNYWhE/6VDn4hdNr+IhEcrcGBNJhRwj8wIrVIoiSAtYu5uPgzs/beD
         NNoql3ZQ3z+CYUsHv1DuefWWFOJdqfM+d83Dfcgu4uykl1R5noUxQtwgDZy68on9UxH2
         ZXDcAhSaTXuJFGylAjqVo8JbeTbsu8qld7IHMkb3vdCzyBJZLZ/fmknEixMYOi91TRk0
         /Fww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742091707; x=1742696507;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xXQAPce9+Da2Thb7jFtKZNkgNkWHZYB4UCuGYADpkwQ=;
        b=qG2VXWmBQDm7/I6KK5Bb+eMYZbg6b+rGQnzKXf+Oti1EIPSr8KbSBZBWKSIIPvP1OB
         XULQiSH7SrcV7a+xirueAjWCP0L474KepmgmFPKQTx50ZMGuHtHsUS8S+/szTzP+rEAw
         Sk0TMY6GwuyszKpFsP7YoB1PAPYinc7Tmp4KSoWm5w5VzfvadiKDjL1OuE2m3I8KpyPO
         L/VzMvtjeet5y5oKIlUxc93JU87fWeQNdFM8Wz2Mdq0dotlHpAUUBg/FWvdg25Ioo3Zj
         +6EZzBULLwCxnyCfR8U+UeuGJ50weyysymkOaAZoclvWmPWHGyVTd0tnZdzffZY9ZHA+
         J5DA==
X-Gm-Message-State: AOJu0YzTcsV24gJz6UkFzLQ2m1f2sxQ/k7EN8jgoWFYfFh5ZBd9ku1FK
	KS615sUu3ftbW5/dKlFFDIUlHETS47851OknyZglR1JdBu8Xuwgt
X-Gm-Gg: ASbGncsFuAQ7/cAU7YCW90JbsNP1x+qiPoSanV/5b7kTo9L9kZ2dCzV/eGN2Sr75NoJ
	dUyBXrBEGa5VAmMN8oN+6HNtdcr9jYbvC5fs9xgr/WsK5BU6JdvsFAZ853kScJbnqse8g/hH47R
	fV6CbKofiQ3KVOLMnOqh+FQ0qilpZRr1MxtW3mRUEoZtoJJpNbF5kibn3InGZDyoTRPxDirmCCn
	6R9v8lrIKRWpWEV4TLtZV1O1I89+Decn1tROo7nESQljwu9yFjkNjJ9u1kMEFlOvV0Hlqb22/BV
	UpSYLbQ58t53xAFqIfChAl+KkqQkd/zoBZw+DscDKa0DWDORs1QE8W7pq4zegbVaPd3boIBHjnF
	wHXTe57Dhnr/lw37/4Q==
X-Google-Smtp-Source: AGHT+IE0mziLQreGnnZV71L6sivPFlpL+qS1/vBuZT4SLTm3FCRnBzyGJK2nVb/xaYlLbDuH4z2uNw==
X-Received: by 2002:a17:90b:544b:b0:2fe:a336:fe63 with SMTP id 98e67ed59e1d1-30151d56e54mr10094445a91.24.1742091706698;
        Sat, 15 Mar 2025 19:21:46 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30153385044sm3746653a91.0.2025.03.15.19.21.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Mar 2025 19:21:46 -0700 (PDT)
Message-ID: <bd23b8f5-2b9e-4f23-a7ec-3d68b96184b5@roeck-us.net>
Date: Sat, 15 Mar 2025 19:21:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: npcm: Remove unnecessary NULL check before
 clk_prepare_enable/clk_disable_unprepare
To: Chen Ni <nichen@iscas.ac.cn>, avifishman70@gmail.com,
 tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
 yuenn@google.com, benjaminfair@google.com, wim@linux-watchdog.org
References: <20250313084420.2481763-1-nichen@iscas.ac.cn>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250313084420.2481763-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=2.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: openbmc@lists.ozlabs.org, linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 3/13/25 01:44, Chen Ni wrote:
> clk_prepare_enable() and clk_disable_unprepare() already checked
> NULL clock parameter.Remove unneeded NULL check for clk here.
> 
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

