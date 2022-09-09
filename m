Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A655B3063
	for <lists+openbmc@lfdr.de>; Fri,  9 Sep 2022 09:44:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MP7Kh0hC0z3bY5
	for <lists+openbmc@lfdr.de>; Fri,  9 Sep 2022 17:44:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=choRwB5G;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com; envelope-from=fercerpav@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=choRwB5G;
	dkim-atps=neutral
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MP7KD5wXYz305M
	for <openbmc@lists.ozlabs.org>; Fri,  9 Sep 2022 17:43:42 +1000 (AEST)
Received: by mail-lj1-x229.google.com with SMTP id s10so204353ljp.5
        for <openbmc@lists.ozlabs.org>; Fri, 09 Sep 2022 00:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=4XMjwR+ZVeD0USbUtiJHh3TkUmGAdp/KlppcqPAVl1E=;
        b=choRwB5G8477CiDOj2pqYwuD9m2AS55XMrKVnGig2OvBR1eCq7RxsLzpulqA2nYZlr
         E2hpeVWo6QP+Y+giRj6Mo/4a2a2Z7qjEVOpMDBskCPg2wKXbgwyISJPPn0cNctE1wrGw
         TVCidUSbPePmCrcfapYi5hkVK1Ch/gtJPWc8Iyzw5t5gbIHtqe2B9NsYmWKomNR9z+/s
         f/nln8Dpka3XLbqD68Ew6Oqcz26dqOj78HsrbkiV6QRaxaXJZcXNYpYlo2TQAT0x3bcC
         yujyILzBlabLOZRRwsDig5/kX2aV/ivVW/h00aedB6cNghw+WbH7VBBJnUr094Or/qTp
         Zb9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=4XMjwR+ZVeD0USbUtiJHh3TkUmGAdp/KlppcqPAVl1E=;
        b=tzHfAOsEr79k0OHkJ8t1Lz+UQ+8ANnVLtY7lcprze6n9UiHhlg89L5jydXomPgAVFe
         YtjNgwk0DHDhi9e5DnC0uJw9h86pK9jFWuQdsOH/+H9PuhMUW2YUpoggYq83fEUNivx5
         A/myVYRcEc8nsnXdDmy8iL87N9mesmTKBLcbyakwOYmL48QVjcGwyOacv8aXJ+bJDewx
         PS7Eflxh2RYmaYNFptRLJXHzSwdbU0BuNITST1dyyXDQe+PvNFzaRePlmujgqYqqfivY
         lCDUegkOMKJP/DGJpIWg2083hKGJ9075xjyZlFvsiVSLrCA7jpyfvt9I/2GVmlOjQ810
         +4hg==
X-Gm-Message-State: ACgBeo2HFNtzwUI6wKANmRh0H+XptJeB6XUe/PK3gOW8JKbAoY2sM2II
	OURER8bx7z0AtPEBkutKsRQ=
X-Google-Smtp-Source: AA6agR7+yVTqO60RqNzHeqffx6oFD+WICAw4ojvnQWZqe1a8W6jSo+QmECUJX5sc0vEmcnl0zde9oQ==
X-Received: by 2002:a05:651c:b26:b0:267:18e2:2024 with SMTP id b38-20020a05651c0b2600b0026718e22024mr3764904ljr.409.1662709413556;
        Fri, 09 Sep 2022 00:43:33 -0700 (PDT)
Received: from home.paul.comp (paulfertser.info. [2001:470:26:54b:226:9eff:fe70:80c2])
        by smtp.gmail.com with ESMTPSA id q30-20020ac2511e000000b004979ec19387sm153247lfb.305.2022.09.09.00.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 00:43:32 -0700 (PDT)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
	by home.paul.comp (8.15.2/8.15.2/Debian-22) with ESMTP id 2897hT0H020245;
	Fri, 9 Sep 2022 10:43:30 +0300
Received: (from paul@localhost)
	by home.paul.comp (8.15.2/8.15.2/Submit) id 2897hRPB020244;
	Fri, 9 Sep 2022 10:43:27 +0300
Date: Fri, 9 Sep 2022 10:43:27 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Subject: Re: [PATCH] net/ncsi: Add Intel OS2BMC OEM command
Message-ID: <Yxrun9LRcFv2QntR@home.paul.comp>
References: <20220909025716.2610386-1-jiaqing.zhao@linux.intel.com>
 <YxrWPfErV7tKRjyQ@home.paul.comp>
 <8eabb29b-7302-d0a2-5949-d7aa6bc59809@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8eabb29b-7302-d0a2-5949-d7aa6bc59809@linux.intel.com>
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
Cc: Samuel Mendoza-Jonas <sam@mendozajonas.com>, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

On Fri, Sep 09, 2022 at 03:34:53PM +0800, Jiaqing Zhao wrote:
> > Can you please outline some particular use cases for this feature?
> > 
> It enables access between host and BMC when BMC shares the network connection
> with host using NCSI, like accessing BMC via HTTP or SSH from host. 

Why having a compile time kernel option here more appropriate than
just running something like "/usr/bin/ncsi-netlink --package 0
--channel 0 --index 3 --oem-payload 00000157200001" (this example uses
another OEM command) on BMC userspace startup?

-- 
Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
mailto:fercerpav@gmail.com
