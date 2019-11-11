Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 838E6F809E
	for <lists+openbmc@lfdr.de>; Mon, 11 Nov 2019 20:53:13 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47BhPf53x6zDqxc
	for <lists+openbmc@lfdr.de>; Tue, 12 Nov 2019 06:53:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::52b;
 helo=mail-pg1-x52b.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="pnt97VBq"; 
 dkim-atps=neutral
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47BhNm3MldzF4T3
 for <openbmc@lists.ozlabs.org>; Tue, 12 Nov 2019 06:52:24 +1100 (AEDT)
Received: by mail-pg1-x52b.google.com with SMTP id 15so10092052pgt.7
 for <openbmc@lists.ozlabs.org>; Mon, 11 Nov 2019 11:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Cxqfg2Er/KjxNZ82ZDQziU0np1GsN167KsiaP1tTJcc=;
 b=pnt97VBq/9TBv09/F/u0caJGZ4d6jF84GsxZLht4Oq5g79RKoGBYnYtGqKgGejfsyB
 pEpgO/sOPpH6pSc09qEml+FCVuGVF6YuesgMSZLnSYNCBRavPJghRP3BPvYZQ4srJnIB
 9r6KX/6v9fpdqV5PoyoAysOKiHxQKAmmsv9aVzUCv3xx3EoYZ/w4rj5fnplKkWb9TgPc
 /kfwlGx/vlOxmeEbPNyPmzY7SGtnfHAoBq7Fqu/3WXD8YHhtE+umq9ItvwsYzGt0gpcm
 Im7Nwfp9/2MP+4PIhJtsMKtlW3xCttDevWaUd1qjilIvTNr0hu+TkyiINZ4CnYVxePwk
 I+gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Cxqfg2Er/KjxNZ82ZDQziU0np1GsN167KsiaP1tTJcc=;
 b=WiTnuI92dg9eHnq7fD9h0MetcoTnN3mHdi+OTCX7VjMDR/2CGxb6uwm+jtfRmQg34z
 UFT/l/xudANX51NQ+I+/5Yh4i4eg/UbONSwCK1w81YvtguCQ1J72rphB8oiH9q2M/2zD
 6DZ86X1mrF3siapYyrwhTmossqrTj9PZAQdwNHYizkxlYkrWO6P+CYDBJAAc2Bd7CG0F
 jtmI7mZtZLn9b8DIqKgI36pDwQ4NdUZ1Ry05F9z/61rht/pyb5kTYjliQYbM/6Pwe/UV
 cLIplfv4bVr8hZ+frFveplom1OXhcJ/UP+kRcQ3unbMVl05YQbvRl4Vfj+ExVMe6pijW
 aRmQ==
X-Gm-Message-State: APjAAAWzOZHDVF84C3aQMHa9KUtCObiuKy+3RO7W8Lmz9jRJunpUxjbq
 8KfZ8p3Fv/zwYVde5oatk59p4SdXxViFUyjCuo3GGg==
X-Google-Smtp-Source: APXvYqwR0/TU4ec2/k/kgxAb0HsoXK30qyHETr9QHL9ByeEoNUQXZdP6NC/H4zrRce/nUab4QlwjGLpF8wgnkRyJqHU=
X-Received: by 2002:a63:e255:: with SMTP id y21mr30146220pgj.353.1573501940179; 
 Mon, 11 Nov 2019 11:52:20 -0800 (PST)
MIME-Version: 1.0
References: <80AD98E1-20D5-4ADD-ADD2-6901A3B77A43@fuzziesquirrel.com>
 <120a78a0-1801-facf-040b-346471c37b70@linux.intel.com>
In-Reply-To: <120a78a0-1801-facf-040b-346471c37b70@linux.intel.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 11 Nov 2019 11:52:09 -0800
Message-ID: <CAO=notwAW25mSOZ64M1jDfWNFteyv9U1zKEQ2i5X7QgMTX7uiQ@mail.gmail.com>
Subject: Re: entity-manager: adding additional fru formats to fru-device
To: James Feist <james.feist@linux.intel.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Nov 11, 2019 at 11:48 AM James Feist
<james.feist@linux.intel.com> wrote:
>
> On 11/11/19 11:43 AM, Brad Bishop wrote:
> > Hi James
> >
> > At the OSFC we chatted a little bit about adding support for other fru =
data formats to fru-device.  I=E2=80=99d like to get started on that.
> >
> > For background and reference at IBM we call this sort of data =E2=80=9C=
vital product data=E2=80=9D or VPD.  Just so we are all on the same page th=
is is the same stuff as IPMI FRU format data, just a different data structu=
re.
> >
> > When I look at fru-device in the context of adding support for addition=
al data formats, the necessary interface seems to just be a set of key valu=
e pairs.  We already have an application that produces exactly that here: h=
ttps://github.com/openbmc/openpower-vpd-parser
>
> If you already have that, then there should be no reason for you to need
> to use fru-device. Entity-Manager probes dbus, so as long as there is
> key-value pairs, you should be able to make your probe
> 'xyz.openbmc_project.MyInterface('KeyICareAbout':'ExpectedValue'). If
> this application can already do discovery, I don't think you need
> fru-device. This might actually be a good excuse to pull fru-device out
> of the entity-manager repo, having them together makes it seem too much
> like they depend on each-other, which they don't.

+1

>
> >
> > Do you have any thoughts on how you=E2=80=99d like that code brought in=
to EM to the end of supporting the IBM FRU format?  My initial stab without=
 any direction from you would be to:
> >
> > 1 - factor (shared) library logic out from application logic in openpow=
er-vpd-parser
> > 2a - update fru-device to try multiple formats instead of just IPMI whe=
n scanning eeproms
> > 2b - add the option to remove support for ipmi or open power fru format=
 parsers
> > 3a - when power format parsing is enabled, link to new openpower-vpd-pa=
rser shared library
> > 3b - when ipmi format parsing is enabled, link to existing code (static=
, not shared)
> >
> > thx!
> >
> > -brad
> >
