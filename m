Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 693853CFA8B
	for <lists+openbmc@lfdr.de>; Tue, 20 Jul 2021 15:30:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GTfj51Tbkz3bWs
	for <lists+openbmc@lfdr.de>; Tue, 20 Jul 2021 23:30:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=qBXL47tA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12a;
 helo=mail-lf1-x12a.google.com; envelope-from=fercerpav@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=qBXL47tA; dkim-atps=neutral
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GTfhl40yNz2yMk
 for <openbmc@lists.ozlabs.org>; Tue, 20 Jul 2021 23:29:58 +1000 (AEST)
Received: by mail-lf1-x12a.google.com with SMTP id f30so29226324lfv.10
 for <openbmc@lists.ozlabs.org>; Tue, 20 Jul 2021 06:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=5UusRkdsoT638YfSrAAm+TVTQJyejuNWHoXYbs2aNFE=;
 b=qBXL47tAt4Zhi3Yd8Laq9Iv0M6oQfmUkVQlf2pVWBHQ2nH/z/Au/S+KXpocQtUrh+v
 PyCG1FMUjuirVkcuhmBrtRD1sJUp2WlJ9wy2WYn884wXLORm9t0rZq2h5WAwcNL4m9KN
 oXrXAWKruMt5Y+Nopl6V0156ENBlDdafi5gIU/lhIDq8yzxyNJxEaizXBznL8PadV2cD
 s2IbOxsh0wvPgmehevPtKxkpJSlJQBvD4Yc/b49VlgNQ+w6jczLrM1jA56+HhrgT+A4P
 xGB/9m+lIwufMKXt+G9XKJgmPgHGu+qBzTIJY5niruFhTcLUH2nLfUDA7T4DbL+Fznic
 JieQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=5UusRkdsoT638YfSrAAm+TVTQJyejuNWHoXYbs2aNFE=;
 b=gOdRAQs4/75/gbh5osc/hHDN7V03R7GhUdh1CStaskxC6e2cQbjs6lBf64rg6qyLki
 O6ORmgrr9hfpOIxXt/TdyIu4nnij7d8tsu99CkChnqq73H59CkajNKucQbOusOG4oMzB
 XxeS/1qJBDFyuJn9nDKBhczCmlq6JH9scE03DNJGq9vLdCvoKDuCxsJdWQGmLbsl4Jpa
 OPD8aT8pBeksu/itP8V11I8IOgvCipOVavNdXrzSdE+MmZuuEV0mCG+q3QwufniTObqD
 Fi+3mVge3AvTjzYxbRlWNheWHZX1reNekVzHP7OGkbSOVU9rkWiNxTpj2R4U2bVyhYId
 Opfg==
X-Gm-Message-State: AOAM533xJGiDhZq0/g5/JbKly/GcZQipyPlDA++joLERlI1tGW1FYUrK
 y0kyIh8gTQ8h+p9iAFsYDRY=
X-Google-Smtp-Source: ABdhPJx54AumcK1aald87HvFI2CB2CceO6HF64yEFUpmxmKeV7JKahWEznr+npQiq9ZtzffnLETwqg==
X-Received: by 2002:ac2:5e28:: with SMTP id o8mr20803519lfg.209.1626787790369; 
 Tue, 20 Jul 2021 06:29:50 -0700 (PDT)
Received: from home.paul.comp (paulfertser.info.
 [2001:470:26:54b:226:9eff:fe70:80c2])
 by smtp.gmail.com with ESMTPSA id x12sm730335lji.117.2021.07.20.06.29.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 06:29:49 -0700 (PDT)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
 by home.paul.comp (8.15.2/8.15.2/Debian-14~deb10u1) with ESMTP id
 16KDTlCw005209; Tue, 20 Jul 2021 16:29:48 +0300
Received: (from paul@localhost)
 by home.paul.comp (8.15.2/8.15.2/Submit) id 16KDThZf005208;
 Tue, 20 Jul 2021 16:29:43 +0300
Date: Tue, 20 Jul 2021 16:29:43 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: Ivan Mikhaylov <i.mikhaylov@yadro.com>
Subject: Re: [PATCH v2 3/3] net/ncsi: add dummy response handler for Intel
 boards
Message-ID: <20210720132943.GG875@home.paul.comp>
References: <20210708122754.555846-1-i.mikhaylov@yadro.com>
 <20210708122754.555846-4-i.mikhaylov@yadro.com>
 <20210720094113.GA4789@home.paul.comp>
 <b1da28a76c249637d6f094b046d851c7622e71d4.camel@yadro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1da28a76c249637d6f094b046d851c7622e71d4.camel@yadro.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: netdev@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Samuel Mendoza-Jonas <sam@mendozajonas.com>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Jul 20, 2021 at 04:21:31PM +0300, Ivan Mikhaylov wrote:
> Paul, I know about 'get mac address' and it was in my todo list. You can put it
> before or after this patch series whenever you want, it doesn't interfere with
> this one. Anyways, thanks for sharing it.

The patch in question modifies the same file in the same place, see:

diff --git a/net/ncsi/ncsi-rsp.c b/net/ncsi/ncsi-rsp.c
index a94bb59793f0..b36c22ec4c3f 100644
--- a/net/ncsi/ncsi-rsp.c
+++ b/net/ncsi/ncsi-rsp.c
...
 static struct ncsi_rsp_oem_handler {
        unsigned int    mfr_id;
        int             (*handler)(struct ncsi_request *nr);
 } ncsi_rsp_oem_handlers[] = {
        { NCSI_OEM_MFR_MLX_ID, ncsi_rsp_handler_oem_mlx },
-       { NCSI_OEM_MFR_BCM_ID, ncsi_rsp_handler_oem_bcm }
+       { NCSI_OEM_MFR_BCM_ID, ncsi_rsp_handler_oem_bcm },
+       { NCSI_OEM_MFR_INTEL_ID, ncsi_rsp_handler_oem_intel }
 };

And your patch:

Signed-off-by: Ivan Mikhaylov <i.mikhaylov@yadro.com>
---
 net/ncsi/ncsi-rsp.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/net/ncsi/ncsi-rsp.c b/net/ncsi/ncsi-rsp.c
index 04bc50be5c01..d48374894817 100644
--- a/net/ncsi/ncsi-rsp.c
+++ b/net/ncsi/ncsi-rsp.c
...
 static struct ncsi_rsp_oem_handler {
        unsigned int    mfr_id;
        int             (*handler)(struct ncsi_request *nr);
 } ncsi_rsp_oem_handlers[] = {
        { NCSI_OEM_MFR_MLX_ID, ncsi_rsp_handler_oem_mlx },
-       { NCSI_OEM_MFR_BCM_ID, ncsi_rsp_handler_oem_bcm }
+       { NCSI_OEM_MFR_BCM_ID, ncsi_rsp_handler_oem_bcm },
+       { NCSI_OEM_MFR_INTEL_ID, ncsi_rsp_handler_oem_intel }
 };

so it does conflict. I suggest if you decide to continue with this
series rather than the userspace solution to include the MAC fetching
patch in your submission instead of the stub handler.

--
Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
mailto:fercerpav@gmail.com
