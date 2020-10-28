Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 519D529D0E9
	for <lists+openbmc@lfdr.de>; Wed, 28 Oct 2020 17:01:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLtbQ2JlQzDqVF
	for <lists+openbmc@lfdr.de>; Thu, 29 Oct 2020 03:01:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::229;
 helo=mail-oi1-x229.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=d4IHcqWK; dkim-atps=neutral
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLtZP1pGBzDqTW
 for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2020 03:00:12 +1100 (AEDT)
Received: by mail-oi1-x229.google.com with SMTP id x1so3402oic.13
 for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2020 09:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6AvzwzoSGnnQKiP1w5+wsHiDenNoEJ5+u+GARPui/PI=;
 b=d4IHcqWK3XlVYAmP+WkXcJJ0yp2jl9P87P1AkyhixAP6mDJremfy4Kx5PFZcCre12P
 OuY5YCd605wM20jaJNqbUq023CQMqoOvhaQcF7dRkvR2qKam5jTXPKYlVWaPHdlKPloj
 mO4SE+fqwL4j+dlGGJHZk8avcheynWKCJvpyytKn49xCMHFsY3WYIdmhB/3m7RZHCQsh
 6aP4R+o5gZh3NVqLW24kx6PeV8UQsWTIMsBxLfYlZd0Co/ck6gDEjs+yeGOY2iR5cXGE
 G73NaX1SUVSpgLIzQUlGbuba3Xw+k/7fXl1L29T+F9foyqsheoWFncfzErPli2UArP3V
 0CJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6AvzwzoSGnnQKiP1w5+wsHiDenNoEJ5+u+GARPui/PI=;
 b=Ax8CO7aalRpyYzW7id7XhoyA8ftCfqcMbXLNSo49qN9hh6ILeOnOfIARvwEgaodlIF
 yxLFZgkSaAgxSvj6uAbOAXu6a25RInhjiiIpWeFjOcWDbeHLhsDyASPQQMWM6hwZOhEW
 t5y4mGe/9uxsTZeXP/ld+vQfcXwAbJRuCwmrvRCeZErZB2cK4WbCHQDHVqPrtkUyaMli
 iArJBFnn+rCXJdo0/hHjQ8LeoDd/JlVjzXcdESW0RxzMiCfz2mt1ChbyWFGodFDLRakG
 8RPXvOPkoP9RPX3DUHZ7QX5mnvqXbvPK1z01mL6FLXEYENpCSn2sRDLt38kxMBz8ViQY
 UUwg==
X-Gm-Message-State: AOAM5315Ep3OsM6BtUIMThJPAd1HEhRgiXu3O9fNOJEkxwiRUxOtotQQ
 CcBaD5THjOWcPaG0BBjFmyT+qT4GsKwnmNFB
X-Google-Smtp-Source: ABdhPJzRA8c5/Rwe7rJjznk6F6StQhJ3mEatqh9uiKYi8LfLJg7mKyTPBuCquCl44Mi40s7FeMHKNg==
X-Received: by 2002:aca:b556:: with SMTP id e83mr68486oif.14.1603900809584;
 Wed, 28 Oct 2020 09:00:09 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id d22sm2565329oij.53.2020.10.28.09.00.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2020 09:00:08 -0700 (PDT)
Subject: =?UTF-8?B?UmU6IOWbnuimhjogQnlvc29mdCBPcGVuQk1DIENMQSBhcHBsaWNhdGlv?=
 =?UTF-8?Q?n?=
To: figo@byosoft.com.cn
References: <002b01d6a30d$5b1d2f70$11578e50$@byosoft.com.cn>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <d78b0330-7e3f-14e1-47cb-a65b515e3a85@gmail.com>
Date: Wed, 28 Oct 2020 11:00:07 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <002b01d6a30d$5b1d2f70$11578e50$@byosoft.com.cn>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: manager@lfprojects.org, openbmc@lists.ozlabs.org, iasi@byosoft.com.cn
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 10/15/20 11:08 AM, figo@byosoft.com.cn wrote:
> Add the manager@lfprojects.org <mailto:manager@lfprojects.org> in the 
> mail loop.
> 
> Thanks,
> 
> Figo
> 
> *寄件者:*figo@byosoft.com.cn <figo@byosoft.com.cn>
> *寄件日期:*2020年10月15日 下午11:59
> *收件者:*'openbmc@lists.ozlabs.org' <openbmc@lists.ozlabs.org>
> *副本:*'iasi@byosoft.com.cn' <iasi@byosoft.com.cn>
> *主旨:*Byosoft OpenBMC CLA application
> 
> Dear OpenBMC maintainer,
> 
> This is the signed CCLA from Byosoft. Byosoft is a BMC solution company.
> 
> We would like to be the contributor of OpenBMC community.
> 
> Please assist in checking and approving the CCLA as shown in the attachment.


Your CCLA has been accepted, welcome!

Kurt Taylor (krtaylor)

> 
> Thanks,
> 
> Best Regards,
> 
> Figo Chen
> 

