Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD2013A0C5
	for <lists+openbmc@lfdr.de>; Tue, 14 Jan 2020 06:51:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47xfjM3tbZzDqNv
	for <lists+openbmc@lfdr.de>; Tue, 14 Jan 2020 16:51:51 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22b;
 helo=mail-oi1-x22b.google.com; envelope-from=leetroy@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Y2beaIB1; dkim-atps=neutral
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47xfhl5c87zDqD2
 for <openbmc@lists.ozlabs.org>; Tue, 14 Jan 2020 16:51:16 +1100 (AEDT)
Received: by mail-oi1-x22b.google.com with SMTP id n16so10701780oie.12
 for <openbmc@lists.ozlabs.org>; Mon, 13 Jan 2020 21:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tppB/OwBdXoStZb44re+Z9UGbqq8usN0Jxiv12xJs1U=;
 b=Y2beaIB1sCylUBBWPmjq7LxJY7ubJ75gKNuxA1SLpHutenx2Qjri5g+/SaEKM9R6ON
 gVOlV4NDVH5kHMo74wNYwNY6+SV7EoEolrIoNZm5O0x6mFbmGc0P2ph5zPjWTBQu5OVl
 ReEPlEPNXfX0myAs+pFlxYYAC+Znq0DaR09dGiK34/cl77WbRIboAJ2xYhfR/XF1sd7I
 ha7cX1VIAHADKhUI9UBApf3/bytPxXCO0PHJWnz4UoW8L6tkpUvHcTyjw5Qqff+CMzZq
 sS9/n6RiI+cmh1uHAa5wnJcpD6wJzHsLkc8xuK9Wk3QW9TPrr78Wb/Ss8L3hcJQGjZNq
 eZvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tppB/OwBdXoStZb44re+Z9UGbqq8usN0Jxiv12xJs1U=;
 b=ucjuSAjvis+7KwVKqf209CvRwZs2JRNE2hNB3ji5JdA4ZCRcYz+z1gRJhqE+AIKDIm
 eoONfsvIDcYuYypD+ZNknMfkbNDoGXFi240FFnJjEJM8wFojBF+lFHqkwJ3OQDfARJI7
 rqMQDcooRVUTiIoMKCyNMptGrh/806+wqV1z/WMtCwUzzqhLyhd4VZe1CMT3uM/XJjPi
 PQ08iIiUJHxiE5LWkdXYKVrOiexvh1ErQC5j86qMQLCNqycHJNixUqKzLRsGCR87aGE+
 GQGmNzk+lKH8k2cPwKrbxry5x88d1gcqie/itgD6fuApMzXZrnIaIK7nWBhpUWtQHhwL
 MPjg==
X-Gm-Message-State: APjAAAXzxgNNZ3bIzM0FCXl0qo8plZclso9/+M+r+zygqoyqG5B0hQCL
 TE73NPvZtr9CsUBN6VK7vWXY2fHSEVT8lM4Webs=
X-Google-Smtp-Source: APXvYqxRTX4Z4KGVDfh2p5/t0Wx/H5PT2693vzmWObeqNPqEIMMiGeAugPxoQ3cbHvpo5HqYsUzpSVuGPfUMD0AsQgQ=
X-Received: by 2002:a54:4396:: with SMTP id u22mr15909449oiv.128.1578981072308; 
 Mon, 13 Jan 2020 21:51:12 -0800 (PST)
MIME-Version: 1.0
References: <CAO9PYRKzfWXx4iOOxoGmi_EFb2rdSBmHxVzh-6mzUf-NBoEajA@mail.gmail.com>
In-Reply-To: <CAO9PYRKzfWXx4iOOxoGmi_EFb2rdSBmHxVzh-6mzUf-NBoEajA@mail.gmail.com>
From: Troy Lee <leetroy@gmail.com>
Date: Tue, 14 Jan 2020 13:51:01 +0800
Message-ID: <CAN9Jwz2h6tsGFSm6e5daXRuxDKYfarcpV=eKDf+RVKFN76pWpA@mail.gmail.com>
Subject: Re: Dose OpenBMC support UPnP
To: Deng Tyler <tyler.sabdon@gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Deng,

OpenBMC supports mDNS/DNS-SD(Avahi).

Thanks,
Yu-Ting Lee (Troy Lee) <LeeTroy@gmail.com>

On Tue, Jan 14, 2020 at 11:32 AM Deng Tyler <tyler.sabdon@gmail.com> wrote:
>
> Hi all:
>     UPnP is well-known and widely used network protocol. Does openbmc support it or plan to support? Thanks.
>
> Tyler
