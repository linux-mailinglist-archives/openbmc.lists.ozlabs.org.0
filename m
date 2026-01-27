Return-Path: <openbmc+bounces-1284-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGXqOru/eGn6sgEAu9opvQ
	(envelope-from <openbmc+bounces-1284-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Tue, 27 Jan 2026 14:38:03 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE7994FC9
	for <lists+openbmc@lfdr.de>; Tue, 27 Jan 2026 14:38:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f0mgV0Kbkz2yGM;
	Wed, 28 Jan 2026 00:37:58 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::a2e" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769521077;
	cv=pass; b=OIVHJesiFMKPBD9a7u8UPD7aCP983NHToMdEZ+ocw3SrqDbfL/0tBqWcPYGDGbyDEwHWKkWnZBjRjxIlIDpcdFSnf7zWToeoNqgf0whaJZyq+rOt73GH+hzVdqqdvEFg5OVgBPWWYkEi8zkBhdM1VBY5TFGSPIbUziwL2Tav+XEgw+LxFRtAfr3A+tZBGyUZ1g/UnxxEYJAoowmZ0wRxUTxqT16++Xx8BcWtxQ4fFpJ9xGPA9BECchFQ40VJqbNVlDL+zXMZQZ82oqnP9/Rhx98N7Bf0Bm7aZ8q0GYOGInQXHGxEZo0hKTamBrfASQGWjVsCL9yJ94YrKpUIgY3r5Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769521077; c=relaxed/relaxed;
	bh=MTvcP72jKm5mQbBYxyk31cGhanrO8H1i2h3j2ASQSBc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cHoQb1GwY+tuaCza0SxfjdswSilNT7U/ce0QUFduqqrjgCnYxAKo6IjmqPhLciSbqxFX0Ge1cBwTQo1qXGxRDgCjiWbJhLfpqKeyn83YQrhlEp/aWzG+f9lWKo5AtcgtgKU/IE48rbf0N0XO84EX67qYVjIqd0E3M+FtclKHJmW+r+m+L37VullFHH3nIAOzeecqWDuNXfO0aL8Z7DYgDDrzESskKjGmYbdlf1/VoIwsLBw1cjrihajn/Gv2cUVgx0L7FLocUPhkcZxLMxyxqQ0J56bTbVx+Ez5jSAcjCwrg889e+xJ+5arZb/KOOBbDuq8WXJ4FWWUGCA3OiN66mg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nibCy/2v; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::a2e; helo=mail-vk1-xa2e.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nibCy/2v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::a2e; helo=mail-vk1-xa2e.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com [IPv6:2607:f8b0:4864:20::a2e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f0mgS0NZBz2xXB
	for <openbmc@lists.ozlabs.org>; Wed, 28 Jan 2026 00:37:54 +1100 (AEDT)
Received: by mail-vk1-xa2e.google.com with SMTP id 71dfb90a1353d-566390e7db3so5462920e0c.1
        for <openbmc@lists.ozlabs.org>; Tue, 27 Jan 2026 05:37:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769521071; cv=none;
        d=google.com; s=arc-20240605;
        b=NNfNNbkoqr7JxEgm/0+kUG////GP6lo+dUxHM3G7Rn45wY15YPyLyifUZOEQHwYSDn
         RO/1c8VP8vzUbkR1+/GH4QTJq8y5gcZU7HSEyHAuQg/1DQmkQ2IeaWLVn087s9/YGVzb
         3BZsu124Zem22UzbRvyP0ORp+j4nCi083plVjhCqvIKsa9Pi/x/KlE/pTldf796o6LXx
         7q9jYxqJfVca5QlluWwxS5QgSFGOcDFhwt0DDbaKj28ABZkN5LoyJ0a+RQcEh95fxJEG
         kajx0WptXMAhKk1+cj8q9DS4em2KzVcMAalRNiThol5Xu1SYH1346sxpuowFKU2kUQ4v
         6MRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MTvcP72jKm5mQbBYxyk31cGhanrO8H1i2h3j2ASQSBc=;
        fh=guSDjApOc2g2qM6jHtoNdVgklsMOKfgFdkHesFUgAes=;
        b=LQWGM/vIOxk+byWDXjLT9lZ7CuunXHy5vILCHN7Dz5iwlrqqvCu6h4eqbopC/I2j4/
         3VHaZI1G3fRyYT1yjl/3cGId4epKFGmS6xXaB5XI7tfstFP5aAHQWxIhoCws/Qp9uwyh
         YLHflFousv7nIIY9xIiv1NNr7sDC4idFgbGnUPgb6IQguIpqsBWHxc3nh9q7hx0DYedi
         KCschWksbAXpiJWxlvEKSU/XZTKTJXcqF/CmIjXifxmWBevyoZIeIw7IF9/qv0mX6s9X
         wn03ZaaB8iERiL2xDLxp5/Rr0+xwYrZKsXbVA/RQVpI4U1+6bt5M3Zbc2/E/WH/nX5mk
         9Vbw==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769521071; x=1770125871; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MTvcP72jKm5mQbBYxyk31cGhanrO8H1i2h3j2ASQSBc=;
        b=nibCy/2viNd61FyTu7BosfXWc3y9FVmcWUODfLjyGsIKbVHvDe3ZOl14VEZdmymqVT
         MzxghgJ7N4AInBQyo0kB8ZuA+T/WZ4AJNXrQzdnvIGQAvTrOwas7B+/Uof/Fs3q8ULYp
         BoCsT7ar34Mw+UZU0cHofOEYVrzAeJsvCiCZi3tWxEHYLnAp4AfIIP7vZu7jH62TVLto
         MW1bbG4GDpS9XzKoNsIAFlpOZktpf6S3Oqyuu/WZW4q6D/tKDHA+QLPEEZXQ2jm5F/4d
         AjcmmeqRJT4FMj9BqF6DbST7jm8rg9m1vYbABcONY6d6ZyvRJQn4MkbY+rhP4wyo+MKr
         KpxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769521071; x=1770125871;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MTvcP72jKm5mQbBYxyk31cGhanrO8H1i2h3j2ASQSBc=;
        b=U/1tJkSwQeKPuDvVVp+chM4Q34I3ebpPlKlI9Zq7v+qKQm4pOvSBKZzO9wnNJauhHn
         Zl0mi2aPNJvm8IRxXbLDuwoy9bd/u6mo8Q8hspd3NURKv7klSdgujnaDIuIFisLCCxoz
         r3G3huNvXWweTU3ElXmu33cbjOXphKBmN2kNbQazVYPS3WuYR+UhuVeesmwr9YZstjPo
         A/ACOIxzaDhlGTyrD31oNYIYjTCkiYKxtBJmPF+V8g/R7jGn13dbJhsM7FI/8g1uORlr
         7DF1QfKXwcE2GCoRBrpEU3tA1DRQWhU4seb+eQsfAwedferZeEitcK0UUY58Dbq6Q0mB
         1+WA==
X-Gm-Message-State: AOJu0YzvmNF869+O+6jS/21hj/6uoRiqFTnBY5SB8QtV+46A8PxNoiAJ
	usTuqllUDugp/ttyIEs2N2a/QPNLK55o7XrUm+t2wPFLzxE7K+asJonv6z0Ms4FqH5D9N1OMCLc
	OYOPGHsBx9XiS5AIXXV0cYcYpJF7eLtPnHixN
X-Gm-Gg: AZuq6aKAobwPd1U3EzecuK2fbAzPZSolFq3ioGoNtTvCABDJpe1YuFK05MOSVz9ePFa
	EoRul9mtl+eIsy3XwYXUsGyHHCnGzJ1GsGNSR2RiMelxXVlJtvjdVKGaGIJeY4EABV0sXC62pgv
	9kzBMg3Qg/dMaaC3mQwCPx/nNwSf72Bng5pTZSWiBvcTNVTlZvNhWonGcY+sqI+zBys/c5ufOHD
	q7YkWGTeGDEGzzIIY9+RuVFyhhv6eSNWdH0RcZzxEDVaN3WEX0cwgZroOQs/11Nh8+ignJCm+jx
	DfmWDhTu2O5OdFvhlSoAfQvIHZwrQmS6pf1wiWkVf7VQ6mnM9si6S0ux
X-Received: by 2002:a05:6123:14b:b0:557:b52a:d553 with SMTP id
 71dfb90a1353d-566794f2c4bmr710939e0c.7.1769521070885; Tue, 27 Jan 2026
 05:37:50 -0800 (PST)
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <SEYPR04MB7755127F14678E6D3616B901F162A@SEYPR04MB7755.apcprd04.prod.outlook.com>
 <TY0PR04MB73524FA10F833221A4C2A51EF15CA@TY0PR04MB7352.apcprd04.prod.outlook.com>
 <TY0PR04MB7352C16AEABDB768394727B2F135A@TY0PR04MB7352.apcprd04.prod.outlook.com>
 <TY0PR04MB7352537F1867EC8D7C71541FF1E4A@TY0PR04MB7352.apcprd04.prod.outlook.com>
 <TY0PR04MB735254690EB4CB7F14A65D7CF1F3A@TY0PR04MB7352.apcprd04.prod.outlook.com>
 <TY0PR04MB7352CD034A25888705A3EEE1F190A@TY0PR04MB7352.apcprd04.prod.outlook.com>
In-Reply-To: <TY0PR04MB7352CD034A25888705A3EEE1F190A@TY0PR04MB7352.apcprd04.prod.outlook.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Tue, 27 Jan 2026 07:37:35 -0600
X-Gm-Features: AZwV_QjJPO7hpvlF65ignHJWv2h9dGj-HjFqXt6lDCZmCjwIIEu75PqqTzDhwFo
Message-ID: <CALLMt=r8TteMjoL+vrJ3GNCfZ82nnZ3N1bz+fgcsD0foWC0RPw@mail.gmail.com>
Subject: Re: Quanta CCLA Schedule A update - 20260127
To: =?UTF-8?B?TGl0enVuZyBDaGVuICjpmbPliKnnkK4p?= <Litzung.Chen@quantatw.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, 
	=?UTF-8?B?Q29zbW8gQ2hvdSAo5ZGo5qW35Z+5KQ==?= <Cosmo.Chou@quantatw.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.20 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1284-lists,openbmc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[geissonator@gmail.com,openbmc@lists.ozlabs.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:Litzung.Chen@quantatw.com,m:openbmc@lists.ozlabs.org,m:Cosmo.Chou@quantatw.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geissonator@gmail.com,openbmc@lists.ozlabs.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[openbmc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,quantatw.com:email]
X-Rspamd-Queue-Id: 2DE7994FC9
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 9:00=E2=80=AFPM Litzung Chen (=E9=99=B3=E5=88=A9=E7=
=90=AE)
<Litzung.Chen@quantatw.com> wrote:
>
> Hi team,
> Please find the attached file for updated Schedule A of CCLA from Quanta.

Thanks for keeping your CCLA up to date. I've uploaded the new doc to
the projects google repository.

