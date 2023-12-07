Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 169A9808220
	for <lists+openbmc@lfdr.de>; Thu,  7 Dec 2023 08:44:49 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GjepkSIK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sm5rs3mKvz3cZ5
	for <lists+openbmc@lfdr.de>; Thu,  7 Dec 2023 18:44:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GjepkSIK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com; envelope-from=fr0st61te@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sm5rD3VXdz3cPf
	for <openbmc@lists.ozlabs.org>; Thu,  7 Dec 2023 18:44:10 +1100 (AEDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-50bf8843a6fso381828e87.0
        for <openbmc@lists.ozlabs.org>; Wed, 06 Dec 2023 23:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701935046; x=1702539846; darn=lists.ozlabs.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IjZmDAUOKG/f79lP7jC0T8rFfaPzDNaVuWtSEPjGuGI=;
        b=GjepkSIKruB9Nf5V/YafhDiAAUdDBfO9FlSNU8KbS6iFKyv91P4anEoKavLNqU8A9P
         iHHGW97RyVdLENz13CZStltGiJbs0gz//b94EJlGFboMGhsXDbcQmIjHAKfsS5dewank
         BV3ZYZThyFdcMOniSOo2OV6fQN/HIc5ZV5ezwUZpUOgptq8QuSy52qulk94KoONgkOTN
         C33dDY1jPiSk3uoFvoXIXNr9dyKp7t/NKo+PJOZmibA32YY0ph4M795RnkprbfzCCftP
         7QrDovXEoDSsQH1iIEhCx4ZojZE0TVsdM++jsZD8bQQjgiPvC1WAy2a6qKqRPsleymnQ
         NAoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701935046; x=1702539846;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IjZmDAUOKG/f79lP7jC0T8rFfaPzDNaVuWtSEPjGuGI=;
        b=oSWswMzARdUUXLD5cxuLWz3sz/nN50uGtfJx6ZxJFbP727vKrxVidp487SXt69POIi
         t947H0dP1siY+JqBC9Nzz4mXR1qheuxhP4RJdzu1yYIjwLEv4j4kwHOARtLlvGQz2I4l
         GldGVPyXf1552vmr/RJHznzkvqwiASbagZy2VwTLmvgs542bbv1JpNEOGIvkYRGA9Bqq
         3dKGsb0wpanZNnmNA1QCjHZC4nqe3GHZaheYGFFbB7AHxfdHnc5n9C4Foz9NQ5KEclyq
         VdMGhCVUiK6yScsxzjM+YwpD/oCkAmFMoZtMpq8OoMaBVv03zOY3AxND+5u5cqga6nnj
         J+Lg==
X-Gm-Message-State: AOJu0YzYhK15TgBHDqvzUMY8YGzKx5AE37dRRTLOHf1vXDPrqqmjg0Ga
	qNbJWHrqEHzsJNJ1bhwkoDI=
X-Google-Smtp-Source: AGHT+IF4BqxphVDa+E+QgZGIFyUi5+lJShaXoIemBoPV3C9gg8IVjWRWbfgHIOu5JG8bVhZh0sYHBA==
X-Received: by 2002:a05:6512:10ca:b0:50b:fd3c:5dab with SMTP id k10-20020a05651210ca00b0050bfd3c5dabmr1433869lfg.27.1701935046155;
        Wed, 06 Dec 2023 23:44:06 -0800 (PST)
Received: from [192.168.1.161] ([81.200.16.167])
        by smtp.gmail.com with ESMTPSA id d22-20020a056512369600b005009c4ba3f0sm99608lfs.72.2023.12.06.23.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 23:44:05 -0800 (PST)
Message-ID: <e735c41f9eb2985a46fa63fb0d0b477513a227f0.camel@gmail.com>
Subject: Re: [PATCH dev-5.6 3/3] net/ncsi: Add NC-SI 1.2 Get MC MAC Address
 command
From: Ivan Mikhaylov <fr0st61te@gmail.com>
To: Patrick Williams <patrick@stwcx.xyz>
Date: Thu, 07 Dec 2023 10:44:05 +0300
In-Reply-To: <ZXFHdtNDvBshKQap@heinlein.vulture-banana.ts.net>
References: <20231205234843.4013767-1-patrick@stwcx.xyz>
	 <20231205234843.4013767-3-patrick@stwcx.xyz>
	 <6abc879a2c29cc8b8044c5c483bff5a01750695b.camel@gmail.com>
	 <ZXFHdtNDvBshKQap@heinlein.vulture-banana.ts.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 
MIME-Version: 1.0
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
Cc: openbmc@lists.ozlabs.org, Peter Delevoryas <peter@pjd.dev>, "David S.
	Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 2023-12-06 at 22:17 -0600, Patrick Williams wrote:
> On Thu, Dec 07, 2023 at 12:23:38AM +0300, Ivan Mikhaylov wrote:
> >=20
> >=20
> > Patrick, I've the fix about ndo_set_mac_address not so long in the
> > past
> > https://lore.kernel.org/all/20230828101151.684010399@linuxfoundation.or=
g/
> >=20
> > ndo_set_mac_address do not notify network layer about mac change.
>=20
> Hello Ivan,
>=20
> I think you're suggesting there is a bug in the code that was applied
> to
> net-next here?=C2=A0 If so, we'll need to get a fix into net-next.=C2=A0 =
These
> commits are just a backport request to the OpenBMC tree of the code
> that
> was already applied to net-next.
>=20

Patrick, yes, there is a bug, I'll write to the thread today/tomorrow
with that commit about that problem. Need to think how to make a fix
for this problem, reverting and make it right until it in net-next or
fix above that commit.

Thanks.
