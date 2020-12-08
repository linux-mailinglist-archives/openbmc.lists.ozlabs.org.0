Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F04F12D212E
	for <lists+openbmc@lfdr.de>; Tue,  8 Dec 2020 03:55:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CqlD52v2fzDqYk
	for <lists+openbmc@lfdr.de>; Tue,  8 Dec 2020 13:55:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::844;
 helo=mail-qt1-x844.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=cMsJkJ05; dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CqlCL55jPzDqRw
 for <openbmc@lists.ozlabs.org>; Tue,  8 Dec 2020 13:54:51 +1100 (AEDT)
Received: by mail-qt1-x844.google.com with SMTP id f14so2546300qto.12
 for <openbmc@lists.ozlabs.org>; Mon, 07 Dec 2020 18:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wgc0cCp0VrmUpgJRDhAoV7zg4pm2AMuePQ0wVARHJrM=;
 b=cMsJkJ05tgO2483nA1UwJqoJo88DU0eKTcwBer6jpK4dEh5rZkvlEKv/UeN5YhBYmU
 n85+ubrZjI/aMFWpRszN6y0lmj6uQTPuAt5E5U4HYqo6Enh+hz+zyhLzaewrZ5grES3E
 vPqIxzOMSzU2sBkZYJvq8yGa90wn7FMuWqWoc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wgc0cCp0VrmUpgJRDhAoV7zg4pm2AMuePQ0wVARHJrM=;
 b=J4BfZDXRhNNDt0BtThHZxI44lgyAT26eTdzSzqJKwsAwKn4R310EEDInv/y3DhDBVW
 yuJk5XZwRsvV30OvGv+GLdudKTzZ4pU/rAZmlf5vvCXVn10pkNzz6/fUU0vsouJaLdfD
 GZWsmjbzHWsqWc4Yybj0WbxcoZSB/SwkGgQKSq9PmC7gSqD/TGx7o+g7HArOtipd7z20
 XDsincnD0NOq4yTDm6zfs77/pftmvjfnAPJkLODt1GOeL2NVP6kA9j0+Gq/6JwgowtAF
 YTBIK5HdXAEEf1OAaM5g52Lolpr1JGVUmAULGHHOxw3CifIL6L2sfjJHu1mJypRkLQoI
 5rmQ==
X-Gm-Message-State: AOAM532cC7UvpG2W+wBZ3ZfbdgSfk1cbkgk5Wg5q9vxKdISGiFQFrlMJ
 r9jY18V7dKLhjH/O1r4lWCyTR6VBdPl3NMcBmRnU+O1G9DmDJOWd
X-Google-Smtp-Source: ABdhPJwBAhVVX4AyZCamuwxlTIhThu3VjnpWg6h8bwd68yIviHq9+oz0TrZT7nlc/UgZ3HgoS0SP2Au4ZFxb0iPxs1Q=
X-Received: by 2002:ac8:6651:: with SMTP id j17mr27704490qtp.176.1607396089292; 
 Mon, 07 Dec 2020 18:54:49 -0800 (PST)
MIME-Version: 1.0
References: <20201130081733.18893-1-quan@os.amperecomputing.com>
 <20201130081733.18893-2-quan@os.amperecomputing.com>
 <6e28c009-dbf9-4d6e-bc98-ccaa5e0c9b02@www.fastmail.com>
In-Reply-To: <6e28c009-dbf9-4d6e-bc98-ccaa5e0c9b02@www.fastmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 8 Dec 2020 02:54:35 +0000
Message-ID: <CACPK8Xej0p4zq5objTR4yLXk3ws9h6DdZtum7VLDAvC5tc7urQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: vendor-prefixes: Add an entry for
 AmpereComputing.com
To: Andrew Jeffery <andrew@aj.id.au>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Open Source Submission <patches@amperecomputing.com>,
 Quan Nguyen <quan@os.amperecomputing.com>,
 Phong Vo <phong@os.amperecomputing.com>,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 1 Dec 2020 at 01:14, Andrew Jeffery <andrew@aj.id.au> wrote:
>
>
>
> On Mon, 30 Nov 2020, at 18:47, Quan Nguyen wrote:
> > Add "ampere" entry for Ampere Computing LLC: amperecomputing.com
> >
> > Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> > Signed-off-by: Phong Vo <phong@os.amperecomputing.com>
> > Signed-off-by: Thang Q. Nguyen <thang@os.amperecomputing.com>
> > ---
> >  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > index 604166ecaefb..10f12e98762f 100644
> > --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > @@ -85,6 +85,8 @@ patternProperties:
> >      description: Shenzhen Amediatech Technology Co., Ltd
> >    "^amlogic,.*":
> >      description: Amlogic, Inc.
> > +  "^ampere,.*":
> > +    description: Ampere Computing LLC
>
> This looks okay to me, but it should go upstream.

+100 :)

Please send both of these upstream using get_maintainers.pl. You can
(should) include the Reviewed-by tags from Andrew and myself.


>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: Joel Stanley <joel@jms.id.au>
