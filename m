Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A594352544
	for <lists+openbmc@lfdr.de>; Fri,  2 Apr 2021 03:56:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FBNT72wymz3bsF
	for <lists+openbmc@lfdr.de>; Fri,  2 Apr 2021 12:56:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=MOvmixvz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::22e;
 helo=mail-oi1-x22e.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=MOvmixvz; dkim-atps=neutral
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FBNSt1JCkz3bsB
 for <openbmc@lists.ozlabs.org>; Fri,  2 Apr 2021 12:56:25 +1100 (AEDT)
Received: by mail-oi1-x22e.google.com with SMTP id w70so3739092oie.0
 for <openbmc@lists.ozlabs.org>; Thu, 01 Apr 2021 18:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7s6YT6IDnIcg8puAI/lAb8fC+DtgzMpuiktVXH/A09M=;
 b=MOvmixvzProhF8mE7emErm2JWxbr4lTwH3XW3NEHEuJiv9cDVMCg041PXLt4hfKqY9
 epAjLLofXf84T797hM5Z4d9VuqpcWwlCwz9fTmZ4NOrmajpBltKGD7ig+swA1EjLZKPV
 E2w/MOT2zp5FTDUsQM698Za0Ar/G+EwnMNctRCYUudvm7bxNf6es1S03+/IYZlY4Ftj9
 RHAagkY/ddKOenolZJxsxNx+UCw6uz7PdgvP+hdxMlURBBwKK0nCzQWNezEUac/Q6zAs
 5DyRVYMdPXZApJdTokm/xhbgYE5bKac2UjGQUVsv18TJd2E2ozqLWpxqzBXfNbtEy+3J
 UYrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7s6YT6IDnIcg8puAI/lAb8fC+DtgzMpuiktVXH/A09M=;
 b=NbyJWrFWM2zyuIfR58yOILmYIiglUsWpOYgW9uba07MjazIk5dKDWLz0CxkKIK6S/w
 wlzIIi6AMeHM/DJjaGY8aA+OXZCodDAiFXKKG6XogCRIRpPKJi21QnBCSrNvGry/QJBX
 ifuthB9PNK6gMgOuJKhl0Hrk3i7uQ3dPfvXXLkfeXGdsnKGu/eQa7GdKE15aUOxjSLkn
 +2ilPFJUjUKxCUWCmo14tFp730dCkuFbJQlqPmE4M36gKM1HGD4hOWnloi9xR7IXxZcs
 i6sx/xDKN9vDS1TKp7GhNFiGP+q29JUL0Lc4o1b44dO/ICGfCyvsI1evyLnU0OPyTXtR
 JfTA==
X-Gm-Message-State: AOAM532aSPFq/3UnaBMnRjeyiphRE4UsOXL7mmnM9FZr/NNPpp8J+ofO
 zTdg1NGmVgaylOjRveTd8Ku7bkg+lqwmmZ7WMSsblA==
X-Google-Smtp-Source: ABdhPJxdtsj//erv9SnIYsmSI3tI6zcPh9p6LEP8oMx+l+NZlB40H30USmkwT2vx+XV/8jgDfS6bjopkVnzawpIKK5o=
X-Received: by 2002:a05:6808:98a:: with SMTP id
 a10mr8246383oic.28.1617328581941; 
 Thu, 01 Apr 2021 18:56:21 -0700 (PDT)
MIME-Version: 1.0
References: <gmu36wVnmbV9lyt9EpYcnZmnPwjF9wtDS0N8K0jOk9UR2uUO0QwQaackzJRPLjil_ZqLxTzX3qEMGl3IE6baoIpS-xh9aMnQL3VkAyXK6KU=@protonmail.com>
 <0a6dd101-fbea-7fdf-b9a6-3895b48a7f47@linux.ibm.com>
 <5197cbe7-1a8b-80ab-2712-9a8f07457432@linux.vnet.ibm.com>
 <nGEUmLQrNSqmytvShVUeFvOUKjW1cOTYv9Hrcmj7LyP1rfIdLOt8f7IkqzPKaXHZXHRGYtHBcjnt6Qo5c1fIw4doEmVwMmGI2e2rNhNXWZw=@protonmail.com>
 <5bcbc6b0-b9d3-a002-0f24-97bd91ba5bf8@linux.vnet.ibm.com>
 <36bafa0b-5dd3-6da5-b18d-847ee4a46459@linux.intel.com>
 <CAGm54UEc9DOGZS0LLhFMP4SNw_-sJ2oa146wXfYvmF3As4xXsQ@mail.gmail.com>
 <axfftQgj4Du8QvWHD4CHEuPSLSJGtLZZTzpZplCpN1Mu63yr4Xm1RiZTuewl3CNqPUZ8mrmZdJsEJUOQiL39Ft64mfW7DzBdLrkDLhylGiY=@protonmail.com>
 <CAGm54UHGr+F-vnO69PLr0MN699BDEDsZiHYoX1WPmF1DZnQLVw@mail.gmail.com>
 <2FVxBtO4gLzVYqZqGL8XwOcI2a_r6x0CaPGmGozxe_VeNp3Y3y05vSntyZPvfn4EDRsHsLjWJnrVSzbeeVDKhPvLILmFKB3hw-MFaEvepAw=@protonmail.com>
In-Reply-To: <2FVxBtO4gLzVYqZqGL8XwOcI2a_r6x0CaPGmGozxe_VeNp3Y3y05vSntyZPvfn4EDRsHsLjWJnrVSzbeeVDKhPvLILmFKB3hw-MFaEvepAw=@protonmail.com>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Fri, 2 Apr 2021 09:56:11 +0800
Message-ID: <CAGm54UFX9LPHArj-2q=w2pNtwgpkjZJE_0Dgd3_8cXB9z3L2vQ@mail.gmail.com>
Subject: Re: IPMI SEL Parsing
To: rgrs <rgrs@protonmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: "Bills, Jason M" <jason.m.bills@linux.intel.com>,
 openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Apr 1, 2021 at 8:56 PM rgrs <rgrs@protonmail.com> wrote:
>
> Hi Lei,
>
>
>
> Is FRU EEPROM required for inventory to work? My board has unprogrammed E=
EPROM.
>
> I constructed the busctl command according as below, I still get =E2=80=
=9CUndetermined Hardware Failure=E2=80=9D. Please can you let me know if my=
 config YAML has any issues?
>
>
> # busctl call "xyz.openbmc_project.Logging.IPMI" "/xyz/openbmc_project/Lo=
gging/IPMI" xyz.openbmc_project.Logging.IPMI IpmiSelAdd ssaybq "Sensor mess=
age" /xyz/openbmc_project/sensors/temperature/BMC_Temp 3 0x01 0xFF 0xFF tru=
e 0x20

You need to put /xyz/openbmc_project/sensors/temperature/BMC_Temp into
sp3-ipmi-inventory-sensors.yaml as well to make ipmid to know how to
map the dbus path to the sensor id in the sel.
