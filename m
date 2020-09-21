Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 115BE272551
	for <lists+openbmc@lfdr.de>; Mon, 21 Sep 2020 15:22:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bw4qw0DRZzDqdS
	for <lists+openbmc@lfdr.de>; Mon, 21 Sep 2020 23:22:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::230;
 helo=mail-oi1-x230.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=iDyYy4Hh; dkim-atps=neutral
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bw4pk4gfdzDqKM
 for <openbmc@lists.ozlabs.org>; Mon, 21 Sep 2020 23:21:46 +1000 (AEST)
Received: by mail-oi1-x230.google.com with SMTP id x69so16864957oia.8
 for <openbmc@lists.ozlabs.org>; Mon, 21 Sep 2020 06:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=YeFzj9syMshx70kBzl/WFkMaqDGTthPv6C/4/VQibU0=;
 b=iDyYy4Hhj7FzvlrVC7X6Hv0qcJisC9Bp5a2lj+6WiX91oAIVMq+jilz2BvlL2Vnagw
 9zJX86tQJv41fh7QwzdJfBVpuHky2jZtm1IryWElHXwsUocBx/0KOjJyU1NWv/5dPYjw
 yBkWVxBRdCm203U5IYwLdgNFjfDnx1YPmvqCUQ3CIldTJvx7PjPaCScnvDrRb8ih5gFP
 4ELwSkTfBLC2iWpRXRJlPrNzh2Vby8C2Fw6SCcbAaHob62x6o9PfkYX9LSs3hwOWaS0H
 vuNBfhZ95lZqq4SOM7+p2aT/Yr0L/fnjvsuLvuB0Bg36iTyVp8H+auZkBO08veYpU/sr
 wZLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=YeFzj9syMshx70kBzl/WFkMaqDGTthPv6C/4/VQibU0=;
 b=rq11YnIg81fISz+gwBLqTydmfgAaVMStHqCY9D4KQbV+X9rNz9zzQsEX1SY/9yykvU
 02GXcKqXXf3TbDpDkvsP5pG3W4x5lw1aB06MGauaO4bDouT3Sd4pUzU/sruLT4qzBIvm
 SgWBMCydon2I2MA/z5VtBlQs5xcF2e6oN58Z8qtgjJbSIPFHC7J3NO88t+VtZXSHZxbF
 PwZK3gYVPIpdp1ERsWNhW4GSlUF8BSi8SNB4yo9Q7D9DiOiVAUIyflaWL2zSbnBZrCKu
 GPTChDOUNMvpZAH/i4N63Qqrj5SsZmHOBtwFk9Qhq9m+zsfPINGTS5xt3re/q39U0wAQ
 cv+Q==
X-Gm-Message-State: AOAM532Xw00W7F9g/csWX4QZBdstCtuVR0uJZ51SeWMT7JjPM6eHzi6j
 vq5uJ+1H81LYXNdDnuy13yh9fSdm55IlOw==
X-Google-Smtp-Source: ABdhPJxpQL5MNH9L3urkfV5Wq5WF/f4ml/DCeq0NlV2en85REnzXVP1WbI5WV/yIytKT6RMRdZTziA==
X-Received: by 2002:aca:d9c2:: with SMTP id q185mr16281690oig.28.1600694502583; 
 Mon, 21 Sep 2020 06:21:42 -0700 (PDT)
Received: from andrews-mbp-2.attlocal.net
 (45-18-127-186.lightspeed.austtx.sbcglobal.net. [45.18.127.186])
 by smtp.gmail.com with ESMTPSA id j24sm5947020otn.64.2020.09.21.06.21.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 Sep 2020 06:21:42 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: interest in a minimal image recipe
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <CACWQX82_GWxDeiX_7P2A6mYBYp0OWUkfQLEsOhHeCgU676s7Zw@mail.gmail.com>
Date: Mon, 21 Sep 2020 08:21:41 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <2EADC669-1B01-4D19-8231-77A02C5E74D4@gmail.com>
References: <20200915202832.rq3os62pdj7mzaco@thinkpad.fuzziesquirrel.com>
 <20200917201032.4dbcqjylrdhljwsb@thinkpad.fuzziesquirrel.com>
 <CACWQX82_GWxDeiX_7P2A6mYBYp0OWUkfQLEsOhHeCgU676s7Zw@mail.gmail.com>
To: Ed Tanous <ed@tanous.net>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Sep 17, 2020, at 4:02 PM, Ed Tanous <ed@tanous.net> wrote:
>=20
> On Thu, Sep 17, 2020 at 1:12 PM Brad Bishop =
<bradleyb@fuzziesquirrel.com> wrote:
>>=20
>> On Tue, Sep 15, 2020 at 04:28:32PM -0400, Brad Bishop wrote:
>>> I have an RFC for an empty image that these users could bbappend and
>>> opt-in to specific image features instead of having to repeatedly
>>> opt-out.
>>=20
>> If anyone is curious how I envisioned this would be used I am =
intending
>> to use it on witherspoon (we are out of space):
>>=20
>> https://gerrit.openbmc-project.xyz/36588
>=20
> Out of curiosity, has anyone run a space analysis on a recent
> witherspoon image?  It would be interesting to know where the space is
> going, so we can start hammering those subsystems back into shape.
>=20
> This is the script I used a while back to come up with relative,
> compressed sizes for all the components in the rootfs.
> =
https://github.com/openbmc/openbmc-tools/blob/master/edtanous/rootfs_size.=
py

I added it to our daily build job.

=
https://jenkins.openbmc.org/job/latest-master/label=3Ddocker-builder,targe=
t=3Dwitherspoon/lastSuccessfulBuild/artifact/openbmc/build/tmp/deploy/imag=
es/results.txt


