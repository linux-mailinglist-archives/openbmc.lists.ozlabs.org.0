Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A2EA4CED
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 02:52:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MBPt02lrzDqKf
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 10:52:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com;
 envelope-from=akuster808@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Wp5/y7XZ"; 
 dkim-atps=neutral
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46F6tw3TYczDrPP
 for <openbmc@lists.ozlabs.org>; Fri, 23 Aug 2019 13:53:09 +1000 (AEST)
Received: by mail-pl1-x62a.google.com with SMTP id d3so4779670plr.1
 for <openbmc@lists.ozlabs.org>; Thu, 22 Aug 2019 20:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=BmMVr7SMfjGHJhsMzFt1c2UfvQZX7luX8CsiI7kjqgU=;
 b=Wp5/y7XZhXdLKhDstbLmzOaR02z2dicw+/NDd8P95jjeoIf2g1hAr0PUuexE5/nC2Y
 QU6zryfDP3A4VENQhr2T8yJ84/OdUT517zk5BGIpDdJavyfVFU2sYbb+8pClb62S1E79
 e+2djZZSGoS8HrrAaut9tYKf6/W/XBPR0tYmed95flz4PB6Un76uF028qs39hrHpFQCw
 PWJw5fZ2FPHkixr1gdN0p4q8EHSoSY7LkpUm+YLEqQ27uHtFfnByrbOm/luukT1OI7NF
 IjmGqTd4uJ6GPFQf7G1b/cfTiCOZeB2+D4HhzlWBh//c8AGzMLQdbo9/it99UnRMH5af
 gmPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=BmMVr7SMfjGHJhsMzFt1c2UfvQZX7luX8CsiI7kjqgU=;
 b=mVNuRueAbcd7pSqUh/bJtYCQRQTgQXbnnT85qxaBYpId0fAvm8sNUHSQArFu5bH11z
 pGHGVbgLhPn5iWkxmAMDtwxpbL0QQArQIx15eJR1M5jWx93ht80L7VAqaY33hiy3iQ7R
 RUVuF3bno3ZzUr0E322HbP3tOpKC3Z+fzg40ml4yMd826MypxCcoJbLWreJ2eUij1eFr
 kbmtXUF9ax+DKmRNVNhAJ/KRONYyD9oL7M7ovUmOoL6gTBrYjo9h36rEZWgMVBr1cK3w
 dmdEfG2asO8q0z65e3Q5prfJhmu/FGNQseT+ihym2hfKVBciTIYA5zRCsKXC8bWQbYz1
 qvsQ==
X-Gm-Message-State: APjAAAX41BmgKHTQNelJnQQiktUYtx9Gz7tEbwgb1pON4wpm7fL0kflB
 k/5WGS5mu8CiQOT1CPNXJ0A=
X-Google-Smtp-Source: APXvYqxKGTDEj2rmDDEX0Nb7+yq/gd2dVNVJZ5/M7+yXPazyTea/75Exu+WyU0ycA2PzYYwqRaFv4Q==
X-Received: by 2002:a17:902:7c8a:: with SMTP id
 y10mr2311702pll.65.1566532386640; 
 Thu, 22 Aug 2019 20:53:06 -0700 (PDT)
Received: from [172.20.6.109] ([12.235.222.84])
 by smtp.gmail.com with ESMTPSA id x1sm923263pfj.182.2019.08.22.20.53.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 22 Aug 2019 20:53:05 -0700 (PDT)
Subject: Re: Build break in the latest openbmc tree.
To: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
References: <038f49d9-099e-dabd-2957-d31e7b8bbf41@linux.intel.com>
 <628d5b4c-63d4-78b6-83d8-1781cbc86e0f@linux.intel.com>
 <7694CCA3-89BD-44FE-90D1-99569476E980@fuzziesquirrel.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <ddea7d78-c68a-f143-40fe-615086d83b0c@gmail.com>
Date: Thu, 22 Aug 2019 20:53:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7694CCA3-89BD-44FE-90D1-99569476E980@fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Mailman-Approved-At: Mon, 02 Sep 2019 10:34:53 +1000
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
Cc: yocto@yoctoproject.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 8/22/19 6:09 PM, Brad Bishop wrote:
> at 6:38 PM, James Feist <james.feist@linux.intel.com> wrote:
>
>> On 8/22/19 3:35 PM, Jae Hyun Yoo wrote:
>>> Hi brad,
>>
>> + The mailing list
>>
>>> We met a build break while making Intel platform builds.
>>> ERROR: No recipes available for:
>>> /home/yoojae/workspace/openbmc/meta-security/recipes-kernel/linux/lin=
ux-stable_5.2.bbappend
>>> It was added by the subtree update patch but there is no main recipe
>>> for it. Did we miss something?
>>> Thanks,
>>> Jae
>
> Hi Jae
>
> linux-stable is in meta-odroid:
> https://lists.yoctoproject.org/pipermail/yocto/2019-August/046424.html
>
> It isn=E2=80=99t clear to me if meta-security is supposed to have a har=
d
> dependency on meta-odroid or not.
It should not. The is bad behavior and I wanted to avoid such an issue.
meta-security is a s/w layer and should be BSP neutral.=C2=A0 I did not
achieve that.
>
> Hi Armin
>
> Could you suggest what the right thing to do here might be?
Yeah, i believe the recipe in meta-security should be linux-%.* . My
testing unfortunately kept the meta-odroid layer included so its a false
positive. Not my intent . I know the qemu machines should build clean
with any changes in that layer.

I am testing changes now to correct his issue.

- armin
>
> thx!
> brad


