Return-Path: <openbmc+bounces-18-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F23A9F296
	for <lists+openbmc@lfdr.de>; Mon, 28 Apr 2025 15:43:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZmPmD54bDz3055;
	Mon, 28 Apr 2025 23:43:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::633"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745847804;
	cv=none; b=CGowznpLj/g4a1N9V93X+LQfWadVo9D6lXPShVhjYx31VzvEAlvvmA2GsbIGqKIL32UnHzrmeZ5sSTlRQ+KenB9jAjP0VDXaT42KNvALochhQwGo7cF9uYD1JHE5biXuodEgpW2HYWnpYE1DxKMwZ6WFMYudMv2uTI9OsZn0OtEVE60EGCpO90qJhQgGv5c6nTTS0338Cyldo4G+KG1utmqqA9N02tQqQkg8oCH9VE3ud/WjZ3MC1yZ0ywDLcHT1etXqJlm7JzSRjQnDxtNQp1rJSqkro4rAhfsjC41q7vk5oy61lr2z+4nzNxFj1CGd3oDyMVgsLnuwAts8nTz8jA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745847804; c=relaxed/relaxed;
	bh=0jn0b9bgsWybkPDuryOtL1m/UMfpTpoxuyM1S/oMSP4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=T57xXBk8MAo/ZUo98qgmZ5bXFv9dui21xYXVcEm53osnAyWMaltJEaYIGymd7OlgVv2cdBCRgI9QAR9phOv3loSATShftEYleR87Fpl806PSxnEAj4cnHYPRi3ofWGmuk2TwIB2fUm5jNPKDGm8r86eBymti+USfML9i9f12GHezBuKYuyI8I1XuWvhPmGec+o40b+yeGQ8kvtPsTxsNQBiCDzwzC98eMDR55wTjAEKGx7pT59Xs9SySazpOGQd2lAVQMRvzuD7wT+HkOgvSADj+nYDkTD4AAk9HXHqBBy2htI4/nbdDCpsZvH0ae1SzxHRY8xt2CVDxBsSjgydumg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LtLR6j7y; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=santosh.puranik.ibm@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LtLR6j7y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=santosh.puranik.ibm@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZmPmC4QlCz3050
	for <openbmc@lists.ozlabs.org>; Mon, 28 Apr 2025 23:43:22 +1000 (AEST)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2243803b776so79762545ad.0
        for <openbmc@lists.ozlabs.org>; Mon, 28 Apr 2025 06:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745847800; x=1746452600; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0jn0b9bgsWybkPDuryOtL1m/UMfpTpoxuyM1S/oMSP4=;
        b=LtLR6j7ytt256KY95YikxoYxNcWC/VzrfGg+HCqNS9lkyPi0ZfzjoB++zheYvKPFvp
         UEZSg/LzlGAG1W2CNVKdDhFJ66jpj7k6ikvlHHKLWwmYDSu711l6nTh+1PQHmnfmhnR6
         Nuy9DLXzfEDd1pFkESMc+YtsVKhbSPMCoQ3GC7cRaWga87/xDuDuARHCHeUUkNu/06fP
         tfPK08wHnq70ogxmPx3EOyMNVibrD3vqPRi5OgoD1ct0i22n/RWUv3PTe9+L5xdLyK59
         p8cErw6ZxHQ5EWbMamK+/IZ8/+InhMLL5xBeaTjQF8UnmZm0ptxsyAj431jmmDnDMqYO
         /jgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745847800; x=1746452600;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0jn0b9bgsWybkPDuryOtL1m/UMfpTpoxuyM1S/oMSP4=;
        b=vQ7clNIXBtXe9zLNHdvHr1LNf8/1ER54INzasZefCW/R7hEkNZ2jP3c1IMRDo3jUxq
         BIzybVg85B53A3S4SQsayFWYenkOn5tkb9tqyThtQsKE9TsAiTw8aSJosKSweTVn6Mog
         qHbOYNWRhNKGAoDjGJ2dsR+f4y6nmQYeoHwUeAfq07qZ7kHNgc8WoQz4uIQ2rBdUMLdC
         RkGKYhlXtWJ3BPxy7FTyh30CsdQLRb3ZhOFVrmDUyQEJhGsl+scQUJDLNu/xTMcOq7PD
         pd8EflAq7au6c7Slmgrv1vg5fqmGzDQwAiO801mt3CD0z6ahtM08LVRSorB2Q4pH2ONT
         /EIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuNBsW5+rZwAWVVxXbQ81rE99bUE+ozvhYts3T6PPqOy26UIv/BX/8jaiEWl45NlF24wrxvAFU@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy/624i0aBUPE347nvjZfYGe8m2Y6iMpvEV8B7LE1jBLuYV/KTb
	6zV8sKfZadTPFrIv0M6CVllIiNPjkgLEg4hiobqt86BDGluBe9dTu/w+hfBF
X-Gm-Gg: ASbGncveozSuDumYdCMSwfB9ap+LnWZ0WcqC7zIoxNeDrbhkqsi/e0ehsHSntN79TtW
	LVhJ+CEl3lALIAKRnV0esnF/IxQxxYiE4gm5yRenMbjr/GZdE2RAqIUTyl1d873NdcFHOnZOyoU
	6VsHeNZkHtiIFkPBRiBDXO+u5cJnPgZVufemsTXCZjlXi68HAHeA4g44FbPln28DhxQib3XQq1X
	pfxVrSjOztiBI5+mJ/v4O8V6UMI1Xi2X6MDnrmBqXRBYxmKaM0lNpvxtFFIdgfyjyA0KiA6/WOr
	ghuolB2xk14MoXLxwP50aIxWcJ20jE5CMS/FZBY3qBkwqy33hImDQYMxOWAhJmVX/Q==
X-Google-Smtp-Source: AGHT+IFaIQnXonBUGOIa6qistv4vCiwKzVKRbn7ZPLcywRLxYnOBhY9tx9LpYh0bCnp32g7k16VqYQ==
X-Received: by 2002:a17:903:1a10:b0:224:1ec0:8a1a with SMTP id d9443c01a7336-22dbf632902mr169623015ad.51.1745847800154;
        Mon, 28 Apr 2025 06:43:20 -0700 (PDT)
Received: from [10.25.72.229] ([202.164.25.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db51025aesm82274855ad.188.2025.04.28.06.43.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 06:43:19 -0700 (PDT)
Message-ID: <9435ce2e-b7a2-415a-a67b-596ddfd7bf61@gmail.com>
Date: Mon, 28 Apr 2025 19:13:15 +0530
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH linux dev-6.6 3/3] net: mctp: usb: Port for kernel 6.6
To: Jeremy Kerr <jk@codeconstruct.com.au>, openbmc@lists.ozlabs.org,
 joel@jms.id.au, andrew@codeconstruct.com.au
References: <20250427153008.3166922-1-santosh.puranik.ibm@gmail.com>
 <20250427153008.3166922-4-santosh.puranik.ibm@gmail.com>
 <b8064801a2f4c50edaf1f69f414751794df87817.camel@codeconstruct.com.au>
Content-Language: en-US
From: Santosh Puranik <santosh.puranik.ibm@gmail.com>
In-Reply-To: <b8064801a2f4c50edaf1f69f414751794df87817.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Jeremy,

Thank you for the review.

On 28/04/25 7:13 AM, Jeremy Kerr wrote:
> Hi Santosh,
> 
>> --- a/drivers/net/mctp/mctp-usb.c
>> +++ b/drivers/net/mctp/mctp-usb.c
>> @@ -48,16 +48,17 @@ static void mctp_usb_out_complete(struct urb *urb)
>>          case -ECONNRESET:
>>          case -ESHUTDOWN:
>>          case -EPROTO:
>> -               dev_dstats_tx_dropped(netdev);
>> +        netdev->stats.tx_dropped++;
> 
> Some weird indenting happening here (and with most of the other
> additions too).

Will fix in v2. Thanks.

> 
> If we don't want to use dstats, we should also remove
> 
>      dev->pcpu_stat_type = NETDEV_PCPU_STAT_DSTATS;
> 
> Have you checked that the stats look correct in your backport?

Yes, they did, for ex:

```
mctpusb0  Link encap:UNSPEC  HWaddr 
00-00-00-00-00-00-00-00-00-00-00-00-00-00-00-00
           UP RUNNING NOARP  MTU:68  Metric:1
           RX packets:1 errors:0 dropped:0 overruns:0 frame:0
           TX packets:1 errors:0 dropped:0 overruns:0 carrier:0
           collisions:0 txqueuelen:1000
           RX bytes:11 (11.0 B)  TX bytes:13 (13.0 B)
```
I will remove the stat_type assignment and re-run the test before 
submitting v2.

> 
>> @@ -340,7 +342,7 @@ static int mctp_usb_probe(struct usb_interface *intf,
>>   
>>          INIT_DELAYED_WORK(&dev->rx_retry_work, mctp_usb_rx_retry_work);
>>   
>> -       rc = mctp_register_netdev(netdev, NULL, MCTP_PHYS_BINDING_USB);
>> +       rc = mctp_register_netdev(netdev, NULL);
>>          if (rc)
>>                  goto err_free_urbs;
> 
> Alternatively, we could consider backporting 580db513b4a9 ("net: mctp:
> Expose transport binding identifier via IFLA attribute") too. This would
> be user-visible, as we would now have an new IFLA_MCTP_PHYS_BINDING
> attribute on netlink update messages, but that should be entirely
> backward-compatible for applications.

Ack. Please Let me know if you have a preference.

> 
> Cheers,
> 
> 
> Jeremy


