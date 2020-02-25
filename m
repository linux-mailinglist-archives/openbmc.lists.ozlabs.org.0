Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BF316B77C
	for <lists+openbmc@lfdr.de>; Tue, 25 Feb 2020 03:02:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48RMdT5CtVzDqMM
	for <lists+openbmc@lfdr.de>; Tue, 25 Feb 2020 13:02:37 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22c;
 helo=mail-lj1-x22c.google.com; envelope-from=mine260309@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=LaGyXp6a; dkim-atps=neutral
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48RMcN3zxhzDqR0
 for <openbmc@lists.ozlabs.org>; Tue, 25 Feb 2020 13:01:40 +1100 (AEDT)
Received: by mail-lj1-x22c.google.com with SMTP id x7so12288760ljc.1
 for <openbmc@lists.ozlabs.org>; Mon, 24 Feb 2020 18:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QANSDLwtbijKoODwMC8aLWK/ZvZ7AMejOg9maHmaoc8=;
 b=LaGyXp6akH8WluJek/u/pn6lv45+fIZpbVf92EfMb5AIiFXwKWXDNehkLcIcAhI2bu
 +TLH5AbOmNL+7+WoAOIv2sbeBuqJ8LHdo37QxVt1GnR85w7AUwPWRu/NuG/zmraG68z3
 ZrzLFw2vVFZ1wYWj6SO3dQybap0mkGWQWtxitOV2HDSGAASNQG39kErp0CKGp7tDMlUT
 scaVvVoHN43l9HJqBLNZHriTjWS5WQdbhnq7YAnEYT5KhXP7xLYc5uhw/7cR/D2XuhSb
 AMxvPXBiaRiouIZyxMdDlQBBea8gHIZ6/bjaZHaMjN0WNLSA/yu0EZURqYvDKUECrUiY
 sj9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QANSDLwtbijKoODwMC8aLWK/ZvZ7AMejOg9maHmaoc8=;
 b=bkiUsWYAcQnEejtbdf0A6FC4kFQynprc+pAnDCf4tJ2U7mcqufsI0Gz/68GYWUNG2f
 GTlKB3sx6eUi1vaXGQvxuqqXgBZzxtcqtbio0HwtNU5qvRgSlLKx7ItP+rPiD01W1DGV
 htYozwsUElBDpXJPz2+2Akkofph9s3Zi/G8GjF8Rv6EkHPDVsKr569NVM34HQSn7LKo0
 jvaxzEsUSBwPJq9CUyNHliF1nqBHfPXOZe5A1TpCaBQkbgqWmi2dKKnapphs8S1BsKv0
 RWpowt173fIqYz2ZXzcBN9M9L/uzFl34Tgle1Jdtwxm7WYE+GcjfM9M+k8mUWYpr8ncl
 PiCQ==
X-Gm-Message-State: APjAAAVBEF0ECq9jjiwvO0ncS/8bRNR/1rMlSsQS75kfi4eRntQolDRk
 0hy0BF1+5ZHStOVqpIWjYg0BFe7OEnYFE1ksDPw=
X-Google-Smtp-Source: APXvYqzVy5Wdq1jRjkIUPkS1aOaRDqiMlb1aZD3wDy8WU3La8/gVwhlcpWkn0W7JQSAFmvdItmKdoZfMQSZ6Nn4+vHg=
X-Received: by 2002:a2e:89d4:: with SMTP id c20mr31282388ljk.228.1582596093756; 
 Mon, 24 Feb 2020 18:01:33 -0800 (PST)
MIME-Version: 1.0
References: <68732B2D-EB7D-418A-86D9-3095223A31FB@linux.vnet.ibm.com>
 <5B7FD9A0-8A4A-4BCC-9BC5-77B5DEBCDD00@fuzziesquirrel.com>
 <20200218202507.GA2219@patrickw3-mbp.lan.stwcx.xyz>
 <329B2251-4BA2-425F-A8E1-886C4E2F686F@fuzziesquirrel.com>
 <20200218215128.GF2219@patrickw3-mbp.lan.stwcx.xyz>
 <B09077F7-2752-4C7C-B005-38B00C6DD428@linux.vnet.ibm.com>
 <20200220163326.GC41328@patrickw3-mbp.dhcp.thefacebook.com>
 <9B609C37-44FE-4636-BFFE-76BB48DAEB10@linux.vnet.ibm.com>
 <20200224203636.GF67957@patrickw3-mbp.dhcp.thefacebook.com>
In-Reply-To: <20200224203636.GF67957@patrickw3-mbp.dhcp.thefacebook.com>
From: Lei YU <mine260309@gmail.com>
Date: Tue, 25 Feb 2020 10:01:21 +0800
Message-ID: <CAARXrtnVf8cccGk29Xgk7V=LvX+ocnrn1jgQHwDT97xGkKO9vA@mail.gmail.com>
Subject: Re: Request for Feedback :: Time Mode setting in timemanager
To: Patrick Williams <patrick@stwcx.xyz>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Feb 25, 2020 at 4:37 AM Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Mon, Feb 24, 2020 at 11:38:56AM +0530, Vishwanatha Subbanna wrote:
> > Proposal for now is to:  *Remove the support for TimeOwner*. It will be as good as BOTH
>
> "TimeOwner = BOTH" today creates two virtual clocks from the physical
> RTC by implementing the Host clock as an offset from the BMC clock,
> doesn't it?  Is that going to continue to be the functionality with your
> proposal or are you reverting back to a single physical clock where both
> Host and BMC can update?

"TimeOnwer = BOTH" does not creates two virtual clocks, "TimeOwner =
Split" does.
"BOTH" effectively enables both BMC and the Host to set the "single" clock.
