Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 810ED2422B4
	for <lists+openbmc@lfdr.de>; Wed, 12 Aug 2020 01:03:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BR7gB4yLjzDqS8
	for <lists+openbmc@lfdr.de>; Wed, 12 Aug 2020 09:03:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b2b; helo=mail-yb1-xb2b.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=QU6Ccmxl; dkim-atps=neutral
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BR7f009lkzDqQT
 for <openbmc@lists.ozlabs.org>; Wed, 12 Aug 2020 09:02:46 +1000 (AEST)
Received: by mail-yb1-xb2b.google.com with SMTP id e187so322527ybc.5
 for <openbmc@lists.ozlabs.org>; Tue, 11 Aug 2020 16:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ITEJjDFyMLNdmHgo/BhFacael9kXsZPWz8bqGnSRn9M=;
 b=QU6CcmxlVABfHKXibPBfqU7+ne2D+Jpn8r3YvlSb2jKPMoVVtlRcn1Lhh0A0kiKff0
 X/5lyLc3phIlR6pHi+1ui5T8DgoYA9S8+G4xadF4NW+ns4mccehQSSn3kzuJfe6hFL8z
 3+hgxYjw8ueXOmE0UiMvQVWjbGCi8lbIPdu+8OtsakJwzpXjMJgj0/EtYBfiTiTUYX3L
 qAsLzy3svXqCO8F2FbDzDXwpqCi1gEvMsoa2kjWTMPptm6HUjwZoW28qVz3lxYvisZCx
 Dg9zSuk9Y1EH4R7EYDNYOSNOCOY+1CrD6bpoToZc+AG1Z+C9m1OyUJGs4JOB8bTQ2GQy
 Au9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ITEJjDFyMLNdmHgo/BhFacael9kXsZPWz8bqGnSRn9M=;
 b=eQslG8msbJQWyGXJH5FkGInMw8XAJ2Dzw6D27VQwcqvrL/+7+xSTOspQwJnDh+5nCu
 cUtw5lg3Fn7bksRTCyP35ZpGxQwTTZ5iB0s3Th60GUv91b9w86UU2ALBHxht+G34M3u2
 QgRx8MUCg85VGQUG2+33LB1zJZD8OMukb4mfNtmFTioSVFzlngC2p92fnkJpzj41E1yG
 mb2uCUOP75e4wk3/0OSgynAJ7k9CT49uolrv+Dmk45gb7GlJ3xENMAKEAHq1yms2RMtC
 PerYLfvLgKCvgRuw5oAB4E4sMxpOOoJCEDJUEmcdI4yxN8EMug6wEIOgbAErLbbd1DPK
 P+Jw==
X-Gm-Message-State: AOAM532Sc0jMrva0ySYRzJ+0kqmE+ALAnMnBr7DMu3lP6yrHJ4bxUJct
 UwelvMv4BIa0sIAimlaRffmSMtHciRFTbu1W01DWVQ==
X-Google-Smtp-Source: ABdhPJzmU5r2kj37mXuInsY5oWrOa4+FTSnJbx4dKZu+axkasFRwIRPxnca/AfRsOV7xgE1vGVOb7ALCEnqf7tpxXzM=
X-Received: by 2002:a25:d98f:: with SMTP id
 q137mr46627339ybg.480.1597186962986; 
 Tue, 11 Aug 2020 16:02:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAHBbfcUoAB_nmsaCh2-vAEAjE7Fuu3MNydHLUwBS7zkt7pcPkw@mail.gmail.com>
 <f1b0300f-06ac-c350-8fcc-24eae806cdb2@linux.intel.com>
 <CAHBbfcUXLueZ3MZAP9b38B-fXyrNCMAeZcC7uk8uPrR5gw=3xQ@mail.gmail.com>
 <2bb88ede-4d35-8b9c-936f-be8dc9a453e5@linux.intel.com>
 <CAHBbfcUDMOZjxSvy8wVW_F9f3+NaX-WU3G5PF1oUoRx5VP7ZoQ@mail.gmail.com>
 <CACWQX82KAhmRbg-CYa8+Yjd8mE7qCM_vG_Q1_hYZVR77c3gdtw@mail.gmail.com>
 <CAHBbfcUJGnsW_dxONwjsT=w3ZM453-o0Ubc7DE7oOJQ8u28=ww@mail.gmail.com>
 <5a59238b-7653-b11f-701b-039d57dd5b98@linux.intel.com>
 <CAHBbfcXRO5ZB3S0T6SyRkWkLLAruKPdS8UhUkyG3qssU5YkHNw@mail.gmail.com>
 <9deda21d-aa01-d15e-464e-7ab0fb2f751c@linux.intel.com>
 <CAHBbfcX7TahfKcVcUqWKQGTK5s9Rzw3mT4_3v4tWtkAgHBgX6g@mail.gmail.com>
 <CACWQX83AdMHFk5NUJmpoesghK_2YZ9MMo6h-KoWzDtZ-jrTYRw@mail.gmail.com>
 <CAHBbfcUBBUpO9o2pNSbr0YKXNRHPju4gNNHxxNxuda9k5D0BYQ@mail.gmail.com>
 <CACWQX809R7wx+qNt5PhZW-Snv0jdPnUVGSt+A_jobrTcYC8B2Q@mail.gmail.com>
 <CAA_a9xJhKikZR0rhZWfVfKF1VKMkP1yUkRJxhWSC37JA-2h7sA@mail.gmail.com>
In-Reply-To: <CAA_a9xJhKikZR0rhZWfVfKF1VKMkP1yUkRJxhWSC37JA-2h7sA@mail.gmail.com>
From: Ed Tanous <ed@tanous.net>
Date: Tue, 11 Aug 2020 16:02:31 -0700
Message-ID: <CACWQX80Y9WAjtW=xiq6PgHX3GnF2b6-CT3fL632OyfPBvk029A@mail.gmail.com>
Subject: Re: dbus-sensors:hwmontemp: additional attribute proposal
To: Alex Qiu <xqiu@google.com>
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
 James Feist <james.feist@linux.intel.com>, Jason Ling <jasonling@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Aug 10, 2020 at 5:09 PM Alex Qiu <xqiu@google.com> wrote:
>
> Hi Ed and James,
>
> Is it acceptable for a device to be listed in both HwmonTempSensor and PSUSensor?
>

Can you lay out a little bit of info about why you would need the same
type in both places?  My knee jerk reaction would be to say no, under
the idea that we shouldn't be duplicating functionality and code
between sensors, but if there are good technical reasons that amount
to more than "one has bugs, the other doesn't" then I definitely would
be for allowing it.
