Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D08AD12EB94
	for <lists+openbmc@lfdr.de>; Thu,  2 Jan 2020 22:57:52 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47phjT4d3szDqC7
	for <lists+openbmc@lfdr.de>; Fri,  3 Jan 2020 08:57:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22e;
 helo=mail-oi1-x22e.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ElEA9SkE"; 
 dkim-atps=neutral
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47phhm1ysXzDq5y
 for <openbmc@lists.ozlabs.org>; Fri,  3 Jan 2020 08:57:11 +1100 (AEDT)
Received: by mail-oi1-x22e.google.com with SMTP id k4so13632820oik.2
 for <openbmc@lists.ozlabs.org>; Thu, 02 Jan 2020 13:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=aivZxdvHkGLNXJTbV7Da5qJHvL/cuIziyb9jZWu+PUo=;
 b=ElEA9SkE9stuFrSJJeWzsGTXWwbCBEbDsCAlKz2G/AZeQT89FSxovobGH8nVPKSMna
 SENxjz8F4IIBDuGzjoBoTlGWZLLGt2uGMyTVfpliTYCzHNXOyXUoZw9u+jG3S3V9iiXR
 TMKKY86V7bMTEO5WTR4JWvaW2RhrMMN7NQAv3U/V47H/0060ZxiOQK9qDq7A8+f/bSzA
 gB7dPDNY6klx8/XvRMCXUgUA2aez3ewHm+WP8M6XxDYGTzHVMg25oiO6ucJC/FJgMqOj
 BFKRZ3nIumOIuJaH6agiAlCFldeTWZByeHpQpW7sRlTdUaCplvBupdtf0XaGhXIJ6Huy
 gJIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=aivZxdvHkGLNXJTbV7Da5qJHvL/cuIziyb9jZWu+PUo=;
 b=PsOqKefF3sJEZEOAPZmWxA7G701A5K57MSrBG6ISuBVTvOIBGSc9D+ArYWjicIQtWn
 JiGqcON7FTg/6ojCjmyiB1bxM/puF6+5ayNBnXlOnl5+up/FhiBiofvPxu4qhrK+rCQ4
 Fv6VhhX7glKVOB0hlKTdSMKfXC52DqJpA+BzEWfa4HsLTzwdgbIoS0Lvz4jYN0hJM5MU
 Kh6XuKvTrjvNW1T/Lvm1NN2VpD3PrTVAWrdhv9yeUF6GoSY6okof2dclrLs/aDUTCM03
 +Gt/BIz7rF4tFQwkn6S9K9Qqn44XRLCjYDhYKv1VuRsXyoh4PJl7yM7LykH5OkimyVP7
 1Yrg==
X-Gm-Message-State: APjAAAVv2Y52A60G0Olbzm3aZrPxnzYcndlc6klBOG2uQQaZr16vgZD4
 rezXZ0L6yYGeCytogpgEI9Y=
X-Google-Smtp-Source: APXvYqwi4xKomZeuJQ3d1xalI3P8xGNsabM3iB8LCvwv8kK4meZCkWWwceP0eMA1GE1S665DYd3SpQ==
X-Received: by 2002:aca:60c3:: with SMTP id u186mr3157205oib.163.1578002227726; 
 Thu, 02 Jan 2020 13:57:07 -0800 (PST)
Received: from andrews-mbp-2.attlocal.net
 ([2600:1700:19e0:3310:a8ef:2ce5:9cf:3dec])
 by smtp.gmail.com with ESMTPSA id t11sm6069485otk.50.2020.01.02.13.57.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 Jan 2020 13:57:06 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3601.0.10\))
Subject: Re: bitbake of individual repositories
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <20191218180242.GA61593@patrickw3-mbp.dhcp.thefacebook.com>
Date: Thu, 2 Jan 2020 15:57:05 -0600
Content-Transfer-Encoding: quoted-printable
Message-Id: <35EA2D06-705F-4709-92C2-2980A6E9D524@gmail.com>
References: <CALLMt=oyMtrZ4iU5BukqrNF4-7wXWPaSOxg20Hr3Y4Lo182Ejw@mail.gmail.com>
 <20191218180242.GA61593@patrickw3-mbp.dhcp.thefacebook.com>
To: Patrick Williams <patrick@stwcx.xyz>
X-Mailer: Apple Mail (2.3601.0.10)
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



> On Dec 18, 2019, at 12:02 PM, Patrick Williams <patrick@stwcx.xyz> =
wrote:
>=20
> On Tue, Dec 17, 2019 at 04:02:12PM -0600, Andrew Geissler wrote:
>> Other ideas out there?
>=20
> I've mentioned repo before as it can assist with this.  Bitbake has a
> feature where you can set "SRCREV=3D${AUTOREV}" and it will =
automatically
> pick up what is in the git repo.  What I've done on another project is
> this:

Does this mean all recipes will need to change to do this? I think =
we=E2=80=99ve
discussed this in the past and stated we like to have more control over
when code is picked up in the meta-* layers.

>=20
>   1. Use `repo` to pull down all the source repositories in a =
consistent
>      tree (and ensure it is in the Docker build image, such as in
>      /workdir).

I=E2=80=99m not familiar with repo. Will this require any changes to our =
upstream
repositories or is this just a tool we can use from within our CI =
scripts?

>   2. Run a small script to fetch the GERRIT_REFSPEC and/or =
GERRIT_TOPIC
>      on top of the checked out `repo` location.
>=20
>   3. Add a small .bbclass that replaces "SRCREV=3D${AUTOREV}" when an
>      environment variable is set and update the recipes to inherit
>      this class.
>=20
>   4. Set the environment variable prior to running `bitbake` and add a
>      source mirror to point at the /workdir location instead of Gerrit
>      directly (eg. 1 line in local.conf).

Your option seems even more complicated then the one=E2=80=99s I had =
above :)
It does come with the added feature of the TOPIC support but our general
statement has been to just avoid requisites.

As with anything though, if you=E2=80=99re willing to put the work in to =
help make
this happen, and assuming it requires minimal changes to existing
repository layouts and recipes, I=E2=80=99d be interested.

>=20
> Now when bitbake runs you're getting the full bitbake to run against =
the
> commit (or commits in the case of a GERRIT_TOPIC) that you've =
extracted.
>=20
> --=20
> Patrick Williams

