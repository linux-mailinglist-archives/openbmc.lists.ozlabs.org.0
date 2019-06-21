Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CC48C4DED2
	for <lists+openbmc@lfdr.de>; Fri, 21 Jun 2019 03:53:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45VMCP0KZrzDqwj
	for <lists+openbmc@lfdr.de>; Fri, 21 Jun 2019 11:53:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="itETsA9K"; 
 dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45VMBq6t8pzDqRr
 for <openbmc@lists.ozlabs.org>; Fri, 21 Jun 2019 11:52:33 +1000 (AEST)
Received: by mail-pl1-x632.google.com with SMTP id g4so2167417plb.5
 for <openbmc@lists.ozlabs.org>; Thu, 20 Jun 2019 18:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1oLc5lQY4IU5aXfQMRhbSsE0uyIQY6BrY5g1wxz/3Ec=;
 b=itETsA9KthTGVhJt02h82wnAXDCn/fUpXes3TtZdoIJ3AfpUc6m4uzVwh8xOavKeAT
 Q2lf2qEkdhBMgzpGhc4equMA1TJux43hUjXmz8n215R9LzamRA642EJG/LtpVgK6mg5P
 I/0G9jtrQa56aeLvVDvqEMGJtmIrudOfsogqx++dc4Vvo/ul4LynPgb39Tt6RgJDHfHE
 nBrV4UjKViQUdJu2ZPpWZ7ovXNLQ71xKJiQmZtt+eOcLodrPJM+8OIfOQoRSGOoTPVQ8
 5/FirUrimsgOaaSPQPsrOXIcCcJl08dUc0QY3mPMK0j/It88Wb8bIaPvezSgOmdVN24a
 RQKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1oLc5lQY4IU5aXfQMRhbSsE0uyIQY6BrY5g1wxz/3Ec=;
 b=JWGnK1ofIzcrK02nG6FfbDNXCMb+uxIH6rgziLPT0FKsL0Gk3wfqDkPXqFeTu0lRin
 yapJWWWz7HY1m3rewSs6Ut2+T2umii1ofieCOt4gIDpK+agKSAe9jAJ3lSRJVg34CiUQ
 DhqcHeP1owYY/+/TyIVqFFGEOjfP9QPTZfJ5uOQTNUMaTf4GaO+1L7YJjf/5197Kn1XD
 D5PDCe5rlvBi+XBd5DHP1cS0z78MPFMT4FpWdfMQdHtvkdWc86etmshL8ttzzvt1h0LV
 cJLvtNPhoKa6uDvECS1xV+Rgc5DyjJKmEyzurl4F+6NKAMtjTTo8rCi4V9THWfmQGrDf
 i9Vw==
X-Gm-Message-State: APjAAAVOPWyKQ2MkgEvPaX4N12F9Gm5Jq+umEm+9oX+9yXCa31Y1QS0X
 0+6vOPMkZ5oQVUPTQoobVCn1mTjDztLpfH7Y0dGbadjA
X-Google-Smtp-Source: APXvYqzfa463mi5HbCt35kkFFnvUMfGoH2RH9Q6UqxSNIqvuBdY5nOFW6thqXfbWJJhl8UPEbKuPVNTA7XVxrMHu830=
X-Received: by 2002:a17:902:9897:: with SMTP id
 s23mr60660350plp.47.1561081949950; 
 Thu, 20 Jun 2019 18:52:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notwO_0MNFY-70bGRwmQZGG4_Wm-=2zddmncKYkT-QkBx0g@mail.gmail.com>
 <CACPK8XdjO8uteCX6WzYWzrhjyWoof=_jwAOpjp=FUMeUwrXcLg@mail.gmail.com>
In-Reply-To: <CACPK8XdjO8uteCX6WzYWzrhjyWoof=_jwAOpjp=FUMeUwrXcLg@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 20 Jun 2019 18:52:19 -0700
Message-ID: <CAO=notzneH1K5w019Szob48gBTniwdAkmWgDCo+nkLhB=0iNrg@mail.gmail.com>
Subject: Re: reduced contributing availability
To: Joel Stanley <joel@jms.id.au>
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

On Thu, Jun 20, 2019 at 5:33 PM Joel Stanley <joel@jms.id.au> wrote:
>
> On Thu, 20 Jun 2019 at 17:55, Patrick Venture <venture@google.com> wrote:
> >
> > Hi fellow-openbmc'ers
> >
> > I will have fewer cycles to contribute to OpenBMC moving forward.
> > It's unclear yet how it'll settle out, likely just a few hours per
> > week.  Enough to finish current things, and review incoming patches
> > (pid-control/hwmon/ipmi-blobs-stuff).  Unlikely to contribute to new
> > long-term efforts or long bug arcs (epics).
> >
> > Watching this program grow as it has over the past couple years has
> > been excellent and I'm excited to see the community continue to
> > accelerate in growth and contributions.
>
> Thanks for the heads up. And thank you for your contributions, it's
> been great to have you around.

You're welcome.  Thanks for all the help!

>
> Cheers,
>
> Joel
