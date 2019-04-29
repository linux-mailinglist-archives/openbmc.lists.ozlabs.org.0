Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2561ADDBD
	for <lists+openbmc@lfdr.de>; Mon, 29 Apr 2019 10:28:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44syV73bhCzDqMX
	for <lists+openbmc@lfdr.de>; Mon, 29 Apr 2019 18:28:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::82f; helo=mail-qt1-x82f.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="Z812Zmba"; 
 dkim-atps=neutral
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44sySR50pMzDqM6
 for <openbmc@lists.ozlabs.org>; Mon, 29 Apr 2019 18:27:02 +1000 (AEST)
Received: by mail-qt1-x82f.google.com with SMTP id e2so10223748qtb.4
 for <openbmc@lists.ozlabs.org>; Mon, 29 Apr 2019 01:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n3EYYtDDYyW9wZYkP412wtVWTUfTaAQllrxfKmTcbqc=;
 b=Z812ZmbauRIiOFkXOF8Hp5jtZHzhQ6aCo/InArJAbsaWNks7P09Hl/J9QeE8aAb5DA
 zWqZlUXo0fNhFXUOhRw39Y1EUbHwHivJ9yYThDikHfYz6W8E0Mcdnis4EqUwnwTnAAog
 UTonzWjU89iwDYVAQIFPUZTNz+5AfWOl2iVAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n3EYYtDDYyW9wZYkP412wtVWTUfTaAQllrxfKmTcbqc=;
 b=QS+5mjQ0wegbr41vsEPAJ46+nC8lJ+h135tBmXWMadebgnz1+wwtgHk0ZU4CufB3rN
 m66kLYHlqQSduCxHXBAwS4KGCexvKyen2nGtBbYjUCuo4m8ibw6OOIOGos+2OC5TTdAV
 TGEJ4n40djTvX6VpKjKP8YEnBFtUcRgMVrNz4mrQqQHN/OG2zhXm4XZGuL+Sl9CQfnIS
 r17Ndt0t24zDCBggC2nGurL7ykguRH2j6R6ZIG8sZh9BJozvWv1miUcwT2O7Xgz6eExq
 EEHNfxul4i7jya2G6ey79R24V0WKcq58Mr8bsQRuymhuaLZaBiXpAr9ZtPel6qZ/qBne
 WHjw==
X-Gm-Message-State: APjAAAV8mRRVFlVIt+1vfzoWf7CE8dDg4zStF5NpzbeP6ERDbAX5tIhM
 0Fwj2fXS/QNp9Pso/kEwlxUibzohA40ya/rcL4I=
X-Google-Smtp-Source: APXvYqwnhhmNiiT7lwgaqXk03Q6SWcSgDVArk8tywyw3Jn6OZ5Oo3VhqH3Xj3aKE6NdRlLuDNZrirA9R+HcY32OoHvU=
X-Received: by 2002:ac8:e0c:: with SMTP id a12mr45600450qti.266.1556526417594; 
 Mon, 29 Apr 2019 01:26:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notxhe24e8-1dTcspD_H7xTy49yEnnn-gJbUciekirzKC_w@mail.gmail.com>
 <CACPK8XfwP_DwqthSwgFGMjqRepGkC1XdziZ+eEds=6ND_Ov71Q@mail.gmail.com>
 <CAO=notwAcxqFTN31Ecfd50rkjKm9X7PQsTFAP4Rc_xvN0wALUQ@mail.gmail.com>
 <e44834c9-2755-1d05-1df1-d0fa930d48bd@kaod.org>
 <CAO=notxCM7hR7bXXOi3Z86PikHxAj7CXSDWda-KV9wWxKSwBdg@mail.gmail.com>
 <CAO=notx6cuUuARoDLrcrMX0fVQdVYahfvUbDNOwj588_0q-Bbg@mail.gmail.com>
 <d5906e53-9e7a-44f3-b8af-c09e7c4db62a@www.fastmail.com>
 <CAO=notwm0eqmk1G+B-YziEf0Y=6PjAPM-Pu=d1Kc6Q_3QD0B7g@mail.gmail.com>
 <66a33cb9-19fe-4ccb-8449-76d2ba807cb1@www.fastmail.com>
In-Reply-To: <66a33cb9-19fe-4ccb-8449-76d2ba807cb1@www.fastmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 29 Apr 2019 08:26:45 +0000
Message-ID: <CACPK8XeHKyVF8FvcS9BCt9uaSaYSR6-+suGYr6-NCDZisK33mg@mail.gmail.com>
Subject: Re: transitioning from 4.17.18 to 5.0.6
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
Cc: Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 18 Apr 2019 at 06:20, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Tue, 16 Apr 2019, at 23:56, Patrick Venture wrote:
> > > > Looks like the issue is 5.0.6 doesn't have the lpc parameter optional patchset.
> > Sorry, I stopped following that patchset a while back, I just assumed
> > it landed.  Was there some push back?
>
> Not that I'm aware of. Vijay has been pinging Joel periodically, I'm not
> sure why he hasn't merged it. I'd like to wait until Joel can respond in
> case there's something I've missed here.

I can't see anything relevant on the list. In fact, I've cleared the
entire backlog today.

$ pwclient list -p openbmc -s new  | grep dev-5.0 | wc -l
0

Do you have a link to the email in question? If not, someone please
send it along and I'll put it in the tree. I assumed it was applied.

Cheers,

Joel
