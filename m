Return-Path: <openbmc+bounces-862-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C7041C4271D
	for <lists+openbmc@lfdr.de>; Sat, 08 Nov 2025 05:41:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d3NYJ5sQwz3069;
	Sat,  8 Nov 2025 15:41:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762470711;
	cv=none; b=Oe7cqi+/TK8tX4L4dS5ceNvQuB6v7kCNDWH3DhRl/3kvyGKjJAfv2gQKeQtq8AWiMV4p1y6S1BdZXrCFsRTS9l0GXrYQCZcN60rZ+DYZs9daYVU0qlijYhcKXGPSg68+WleHAAOZdrpLtMIGhi0cU4BxE5VRUvlRIvb6hs8wpGgNQdQ0jdAFvuYwrdOurOlwJV6n095YSK24q8Cyi4xbc+ul00aozTplEkhl1PUmJ04QpV7TUwvozSq5SpyxdIB7hIw9UNDTugvnearBuLVFC7nNDQZRsQKHoELPF+pA+oN6ythj41g9AviEifDD59/2klcMcL2vthhdmFqlsvn41A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762470711; c=relaxed/relaxed;
	bh=QXr28wg8D7Sns2qkEeLZq8j8Ed6Tt4Rhy3ccABxhAR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=j048BrDCiQesk0aEKL26AuySD28k6mvbj2mzX+Mg8HSk22Jnpw4XlNJUBLruXgwzZQLm7f1ghLgyNhCbQDX7hwnd6uyghaRy1FzpMjokLryLQuy9xwgPDLokfjhUmj0Q1wN/t15/GeFznT86TfhiJGT9wrssX35+IbMdt6OyDLZYpMVJl9bP+j1eMSTXFXobYYXx2h3wZikkC/MftU+vMfq9R3XyYa6i55zRenFGMwMvBnW6KaziND35OlwK/PRuH4s08yG41cj3WyPyO5uYk3qTimK8onKZoVa+GhNaMgppmujt3QGBfNr8pV8TaWfmVLOq5rbQ/Rp9pRZ0G6JIOA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GUV/DLNX; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GUV/DLNX; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bmasney@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GUV/DLNX;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GUV/DLNX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bmasney@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d2dHV2SD5z3bf2
	for <openbmc@lists.ozlabs.org>; Fri,  7 Nov 2025 10:11:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762470706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QXr28wg8D7Sns2qkEeLZq8j8Ed6Tt4Rhy3ccABxhAR4=;
	b=GUV/DLNXHts4zxWX8AbDqCvFRQz4Is7unaQwztTX7Aynw6vhaxEOZWvX0L9/d5/Bl2V/6F
	xRX6CFwS/Ks9kOmCp0D7Vmf06rbLce3ZQnu+Et6EfdjQwcSNUL3UvkwX0AP/yLZH9t66Ii
	ulxqd6Xs8V3dtHLGrFuSvT0z15BKI+s=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762470706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QXr28wg8D7Sns2qkEeLZq8j8Ed6Tt4Rhy3ccABxhAR4=;
	b=GUV/DLNXHts4zxWX8AbDqCvFRQz4Is7unaQwztTX7Aynw6vhaxEOZWvX0L9/d5/Bl2V/6F
	xRX6CFwS/Ks9kOmCp0D7Vmf06rbLce3ZQnu+Et6EfdjQwcSNUL3UvkwX0AP/yLZH9t66Ii
	ulxqd6Xs8V3dtHLGrFuSvT0z15BKI+s=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-345-XC9iMl49N8irJ0lomcgQWQ-1; Thu, 06 Nov 2025 18:11:42 -0500
X-MC-Unique: XC9iMl49N8irJ0lomcgQWQ-1
X-Mimecast-MFC-AGG-ID: XC9iMl49N8irJ0lomcgQWQ_1762470701
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8908a248048so37199485a.0
        for <openbmc@lists.ozlabs.org>; Thu, 06 Nov 2025 15:11:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762470701; x=1763075501;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QXr28wg8D7Sns2qkEeLZq8j8Ed6Tt4Rhy3ccABxhAR4=;
        b=rPc/njGnM9uIJ77gsc7UAEP1rd3OBRh0rhuGcfIzzkuv5SnRxUFadiom0QY+FycBA3
         L6Ik84hIWZnVqzGG8+uwbyWp+oyI6He8ieR2w4KwlyCMcBJLsr7KrzrQX1bGrv8oqYOT
         Lo8k1I8ATPPVJD/FB742RmxgtrtRWyGb58e2u1SHPYQqkwM1ly/ugIW987Sgl/B1wr7P
         /NTS8IsRNDWuHrLfUhpuUH9Txko6YhTOUs3kMrdO49IeFDXuXjlhjZnrxVAB5HvqhLfG
         TS+Xfp0L0VzghgFo4x1ZuEWYlEanSUEMAZoHDBd5+WU5RCwN5nYkb6T9wXrWkOajeLKd
         09yQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+G1lluoBp4jQ+R/FobLKzdJmUcVhhZQwI5ufjcxZNeoftAWLTFQ7QtPzM4n3fzSnufmajtTYr@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxkKSwDM+OERjuKUsc/OE2QzL1sT1WBIklvlGMl9GZj+E+CJ83F
	8E6MHPbHvjYcs86TphgBGYwdyFY5nn2k+b5UA8ErbrroX6J7AOoS3eHPKMu75L0f4jafRtVxkBb
	5zD5gIdts0pryYmFLq76nb4HU42uopNFTscMHxpeIVGNP9tRm6DLj1tvX0FMV
X-Gm-Gg: ASbGnctxMD46Jcbl+ycv0J3VOUqy3abCznG+2O72/N+3Wb70lHQFkT/Ux0kyLwgR9NF
	eba7k0lxiE4qeCNcCOCCw9vHGg+skpOj5botXo8Cel6gpH5wl8spMusKzgb2B82JkVtWUQg3F8Z
	mGxjQBt5mj8Ij6gR2bZoFLv1ATR68D4r39HgDQ1W3MmSPA19Cc4xEoW/oxAj3PNRdABK1MMs7rI
	IrtnB21JLmv1sQx/gIk3hABepwlfGiINGZhHe/z4gIrYC/dvQhB3cMiPlMp7aoakU1zFhbchUgt
	l+NfKKFQ4tBDk77Irk/ZeaDwYCLc8UXBPVF+anbh0fxAnKGBxLeeISk8AbjohdcF6GQeuNH6T05
	PGlzqp4kz3mh7H0v9CJqTGfB9FbHmxmwF3g==
X-Received: by 2002:a05:620a:31a4:b0:8b2:43f7:c07a with SMTP id af79cd13be357-8b2452a2167mr193181685a.22.1762470701627;
        Thu, 06 Nov 2025 15:11:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHVetiFRByjjykyfxVb5wuiQuE2TgT+5D6JC3vwCG5rcTtdy2u5B3i2rGtKd9IxnXFml+2NaA==
X-Received: by 2002:a05:620a:31a4:b0:8b2:43f7:c07a with SMTP id af79cd13be357-8b2452a2167mr193177985a.22.1762470701157;
        Thu, 06 Nov 2025 15:11:41 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b2355e56c0sm281056785a.14.2025.11.06.15.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 15:11:40 -0800 (PST)
Date: Thu, 6 Nov 2025 18:11:35 -0500
From: Brian Masney <bmasney@redhat.com>
To: "Winiarska, Iwona" <iwona.winiarska@intel.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	"joel@jms.id.au" <joel@jms.id.au>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"sboyd@kernel.org" <sboyd@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"mripard@kernel.org" <mripard@kernel.org>
Subject: Re: [PATCH] peci: controller: peci-aspeed: convert from round_rate()
 to determine_rate()
Message-ID: <aQ0rJ3ahOV0gmUVM@redhat.com>
References: <20250810-peci-round-rate-v1-1-ec96d216a455@redhat.com>
 <aMatZAX6eFI1RmDH@redhat.com>
 <28dc3bd8aeca7e3164747960747f75060c596704.camel@codeconstruct.com.au>
 <aPEZSY6RC-UVclxN@redhat.com>
 <ba2e6b78e59afb7c89e5022770a142ec8c31659a.camel@codeconstruct.com.au>
 <2025101759-runner-landing-374b@gregkh>
 <2975918e3f3a7de245e93fbee52335acb78bb23a.camel@codeconstruct.com.au>
 <2025101721-twiddling-huskiness-4852@gregkh>
 <13566a08eeaed313ad789abcae1920d9b00483b0.camel@codeconstruct.com.au>
 <d53256b35ee7089607463c66bb4a8c3420faf058.camel@intel.com>
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
In-Reply-To: <d53256b35ee7089607463c66bb4a8c3420faf058.camel@intel.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: o6VAdwpVQJulswQsnwyprKHwwrMmdBQkeoz8ccvju5o_1762470701
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Iwona,

On Tue, Oct 21, 2025 at 09:01:23PM +0000, Winiarska, Iwona wrote:
> Sorry for the delay - for some reason this entire thread didn't land in my inbox
> and I just found it now, randomly browsing mailing list :/
> 
> I will sent it as a PR for v6.19.

I'm just checking if this patch should show up in linux-next by now?

Sorry to be a pest. This patch, and one other series in another
subsystem is all that's holding me back from removing a legacy API in
the clk subsystem. I'd really like to get these dependencies merged for
v6.19 so that I can do that cleanup work in v6.20.

Thanks,

Brian


