Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FFF2317AC
	for <lists+openbmc@lfdr.de>; Wed, 29 Jul 2020 04:29:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BGctS31rqzDr0Q
	for <lists+openbmc@lfdr.de>; Wed, 29 Jul 2020 12:29:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b30; helo=mail-yb1-xb30.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=iOSaTqaj; dkim-atps=neutral
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BGcsf4CXMzDqxc
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jul 2020 12:28:22 +1000 (AEST)
Received: by mail-yb1-xb30.google.com with SMTP id m200so7564155ybf.10
 for <openbmc@lists.ozlabs.org>; Tue, 28 Jul 2020 19:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GxZ4IQQf47YM3/c2/cq0RO2YqKlK6oA05+IfKK718Yg=;
 b=iOSaTqajt1NjIZbjomyA7KVpJm+pwMsru47U8ssmblbOWIRdTBMQKQZGN7CD8+BhdU
 mAntgBhXU8faTIpvcRm9D//eIAm/8WOdfYmu1eATax9h74nLABnM3PnCHZcklqDWlt5k
 AtIsn2wyP468FtRe3YV4zbK+HbFmw9xXQBV1NHlelQ1RZXtIXjVqaF9JZjgWf5XBoAGO
 V7/ghJ2npew4Bqoshi6tr9/dllviWq4WJ9iTiPli19e2WmHWUkeM5lSe9y+w1wOmkgBk
 gCNsZH+an2qQcU1NSLIifU3jnE6TEAagasnMR3FjJ0qtndNqNem2qEFXBnXdNgNgf8ys
 cKMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GxZ4IQQf47YM3/c2/cq0RO2YqKlK6oA05+IfKK718Yg=;
 b=k9nccY6ZI+1OjX8PMtRE6IVJN7WHknsizKVDkf32g8HHPXJ6MnWZ3fvt4VL12f8NiO
 avLpV31QXx22DQ90SqNgckOlnkB1u6Jeizva/gXqIdjtWowxVNMTPC9gKGiUJLqrbG/6
 QVHTiSitVOAFhSw7Q+dK0uWLlrTgl3YLo2pkMpaHYynTdOM3M1tWKegdwuJ9DcUPBKD9
 GRMDVtlb5l1fShKw54U8aUmudT8UNGioxaIbEzRLvQ3mL0TTIQ/2ranit+D5BzcTvHYF
 8J6NfmlO1puB+AWW5WOVaQuq5vOCPrtkYx8v6dmzPKaa1UH0j7Ts3Gqi9RrQ4pen1Pw1
 Henw==
X-Gm-Message-State: AOAM530lkqXvLvc1qq7t+DYV0Yjcy5oz3to7y/N9x1lIAvX0ckZyKaXG
 ejfPX8BQ5wE2iLOKr68wMvLiX84s5EsDmfIkgHWvkv6uiuqllw==
X-Google-Smtp-Source: ABdhPJyy+eFf+QEV1fdCl+9Ay8WtdTU1YUR3tIrmComVe+mgrhp3BwlJcKZMmNU+JEnkE3LWk+HaH+r90u9bqpAQFYI=
X-Received: by 2002:a5b:74d:: with SMTP id s13mr42603402ybq.170.1595989698889; 
 Tue, 28 Jul 2020 19:28:18 -0700 (PDT)
MIME-Version: 1.0
References: <d50417a7-3cc2-1674-b4d1-09283c4ddaf5@linux.ibm.com>
 <20200727173258.GQ3922@heinlein> <18129.1595955887@localhost>
In-Reply-To: <18129.1595955887@localhost>
From: Ed Tanous <ed@tanous.net>
Date: Tue, 28 Jul 2020 19:28:08 -0700
Message-ID: <CACWQX83hOUEVS4hjy3MSwhwUnb9U+SjktJPsWKkTzRygX4pxuw@mail.gmail.com>
Subject: Re: BMCWeb policy for HTTPS site identity certificate
To: Michael Richardson <mcr@sandelman.ca>
Content-Type: text/plain; charset="UTF-8"
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
Cc: openbmc <openbmc@lists.ozlabs.org>, Joseph Reynolds <jrey@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Jul 28, 2020 at 10:06 AM Michael Richardson <mcr@sandelman.ca> wrote:
>
>     > I'm less settled on using a certificate which is clearly expired, but it
>     > is still likely better than using a newly-generated self-signed
>     > certificate.

The original implementation just caught the
X509_V_ERR_CERT_NOT_YET_VALID error and ignored it, but your idea
would work as well.

One thing we had considered is requiring that the CERT date be at
minimum AFTER the firmware build date, under the assumption that the
build machine had a good grasp on what time it was at the time.  We
could use this for gating the upload of a new cert, but can't use it
for invalidating a cert that already exists, as we run into the
"upgrade causes denial of service" problem.
