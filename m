Return-Path: <openbmc+bounces-1340-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCxDFpqHimk1LgAAu9opvQ
	(envelope-from <openbmc+bounces-1340-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Tue, 10 Feb 2026 02:19:22 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A626115F2F
	for <lists+openbmc@lfdr.de>; Tue, 10 Feb 2026 02:19:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f93ck1LvJz2xQ1;
	Tue, 10 Feb 2026 12:19:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770686358;
	cv=none; b=FU1LR70LpNSmUX8vZo8SMMNKQUNbDJKP8xx8/+3tNs26kJ1ei5gLvsTms9pLyNuZAWO/IPqgg1M3EVkq92ezJma0Cwsk99DRUv8hZPq0z0Vhu2yAgMu2XPGQ8ZDM/jsnnp+wmNWw2tHzIuCMmd7A4RfnF49oVDr5hXmrL8Su/W4o/WODfljupXuE0A4W3XEcvkXscv83CZmwk71VUmiqTFMFZ08QnA2v0TddUbJa2IFo3Idl/+dnh27xaquyWaYpdw4jT3eRqHoml+rVMmgNUW8Z4S3Izpd6n2iWeoR3NXeQ2sIFNLtU98lBMeGhVhFrnLN9IiwEgbYxyc2xZ8pm5w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770686358; c=relaxed/relaxed;
	bh=TTnB6Vo/xrzoTWDJPMY/0x+ao+HH1euTwXbToq1L3ZQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ovmjVt4iCZWMCzKtCETyIU4Q9ndhux7sIqnAU7fjwZ+QjVGoPDLXvCXLeozB7tbCfE6mGpMKSLfatFrQjJ3JI286PZ+t9nmCvwN1Zp5MZMB94IlTOaMBHdCEkogZ7ZEBouxkgf5ppOQXk3KcZ58n6trU5Y74kAARwA0l9FIyl6ylR6BzyrK4nfvHIlIoti10KCBxG5EEc7aDoT7Kj4F4vhIznzgrhsC2eO3pWXOE8CTk37TZW7Ezw9Jyy9dLkZNrLF56hCBtFyysYC/F1MbEonxnw9JgvanC36iC6KqlbETlTNOw6FbFWtEONEu9ricS2PpwpAoi2L4F3zd3PZZeMA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=hqd+xd5A; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=hqd+xd5A;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f93cj2t3Dz2xN5
	for <openbmc@lists.ozlabs.org>; Tue, 10 Feb 2026 12:19:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1770686356;
	bh=TTnB6Vo/xrzoTWDJPMY/0x+ao+HH1euTwXbToq1L3ZQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=hqd+xd5ApgqJ0snYoikOOI0+XKqZ4T3ha002VHaLny9cdRhxSGmw5uMZDlCvGoRz9
	 6p/+K8Tp/h5lHHIJJHNNdQoYy8nrQVrxZlWukm/0SvOZnhydP0QbjIO46U+r4Wyv2u
	 0t55FJIqLBY1F7D0gRmQXLBt+qho5eJKAS//XDTG3TMp1etGjOCUCMMH26xvDgVjVI
	 MY+Mul9FB9bhGEf1eybqqFTlPNU/ssx4TB2I5kg4w3L9OPhObXqppUnle2ZN4H1Bgx
	 b8GZSDDSjmXlsrow5DsS0moIbls54NH0EehmkZtOrwTFuGvjACsiNShQso8ruOFWDp
	 LgEUtDbieoWLw==
Received: from [192.168.68.117] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 7282B603B4;
	Tue, 10 Feb 2026 09:19:16 +0800 (AWST)
Message-ID: <a9373437989a4ade7dbd9dc9714c8df655daa1b6.camel@codeconstruct.com.au>
Subject: Re: [PATCH u-boot v2 1/2] drivers: spi: Add support for disabling
 FMC_WDT2 for aspeed
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Ivan Mikhaylov <fr0st61te@gmail.com>, Marc Olberding
 <molberding@nvidia.com>
Cc: joel@jms.id.au, openbmc@lists.ozlabs.org, eajames@linux.ibm.com
Date: Tue, 10 Feb 2026 11:49:16 +1030
In-Reply-To: <c0fb8ab537cc9b234bf0afd4289c0e72a7e5ca04.camel@gmail.com>
References: <20251202-msx4-v2-0-a605d448bd02@nvidia.com>
			 <20251202-msx4-v2-1-a605d448bd02@nvidia.com>
			 <CAKkNK0JOPAyw8HA0XnD836d115p5YBbo=uBD9eXXvByzCv92Yg@mail.gmail.com>
			 <aVxRrM14yN3YZ6Xo@molberding.nvidia.com>
			 <CAKkNK0JGjmurZQ4C5jnOBGAig3n24xr4FAxHpyvqWyTTTHW8eg@mail.gmail.com>
		 <324c2abf90b0c1712b2407b9a9b6f80ae590cb4c.camel@codeconstruct.com.au>
	 <c0fb8ab537cc9b234bf0afd4289c0e72a7e5ca04.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
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
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.20 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[codeconstruct.com.au,none];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[codeconstruct.com.au:s=2022a];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:fr0st61te@gmail.com,m:molberding@nvidia.com,m:joel@jms.id.au,m:openbmc@lists.ozlabs.org,m:eajames@linux.ibm.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[andrew@codeconstruct.com.au,openbmc@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,nvidia.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-1340-lists,openbmc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@codeconstruct.com.au,openbmc@lists.ozlabs.org];
	DKIM_TRACE(0.00)[codeconstruct.com.au:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[openbmc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email]
X-Rspamd-Queue-Id: 2A626115F2F
X-Rspamd-Action: no action

Apologies for the delayed reply.

On Tue, 2026-01-13 at 23:55 +0300, Ivan Mikhaylov wrote:
> On Mon, 2026-01-12 at 11:42 +1030, Andrew Jeffery wrote:
> > On Tue, 2026-01-06 at 17:52 +0300, Ivan Mikhaylov wrote:
> > > On Tue, Jan 6, 2026 at 3:05=E2=80=AFAM Marc Olberding
> > > <molberding@nvidia.com> wrote:
> > > >=20
> > > > On Sat, Jan 03, 2026 at 12:24:07AM +0300, =D0=98=D0=B2=D0=B0=D0=BD =
=D0=9C=D0=B8=D1=85=D0=B0=D0=B9=D0=BB=D0=BE=D0=B2 wrote:
> > > > > On Wed, Dec 3, 2025 at 2:53=E2=80=AFAM Marc Olberding
> > > > > <molberding@nvidia.com> wrote:
> > > > > >=20
> > > > > > Adds support for disabling the ast2600 FMC_WDT2 through
> > > > > > a device tree entry in the fmc node.
> > > > > > Set `aspeed,watchdog-disable` in your device tree to have
> > > > > > the driver disable it.
> > > > >=20
> > > > > Marc, FMC_WDT2 doesn't disable watchdog, it controls ABR mode.
> > > > > Watchdog with or without ABR still in operational mode.
> > > > > So, maybe aspeed,abr-disable?
> > > > >=20
> > > > > Below namings probably should be corrected.
> > > > We aren't disabling ABR mode with this change, right? That's only
> > > > done through hardware straps or OTP changes. All this is doing is
> > > > clearing bit 0
> > > > of FMC64, which per the datasheet disables the watchdog. The idea
> > > > here is
> > > > to just allow boot to progress normally, without the watchdog.
> > > > For ping pong update,
> > > > userspace can flash the alternative SPI and re-enable the
> > > > watchdog timer on complete,
> > > > and the BMC will boot from the new image upon reset. Let me know
> > > > if I'm misunderstanding
> > > > your comment.
> > > >=20
> > >=20
> > > Marc, when you clrbits_le on FMC64/FMC_WDT2, then you disable ABR
> > > mode, I
> > > assume you can check it with evb board or ast2600-a3 to prove. On
> > > my board
> > > ast2600-a3 it works in that way I described with enabled OTP strap
> > > for ABR.
> >=20
> > Can you elaborate on the sequences involved?
>=20
> Andrew, same as in this patch but with mw in u-boot run script=C2=A0with
> enabled OTP strap for ABR.
>=20
> > The reset definitions for the FMC suggest it's affected by an ARM
> > reset, which should in-turn reinitialise FMC_WDT2 and follow the boot
> > flow to enable the ABR again. In my understanding disabling it in
> > firmware shouldn't prevent ABR operations subsequent to future
> > resets?
>=20
> As I know, yes.
>=20
> >=20
> > Further, the aspeed,watchdog-disable property is to be taken in the
> > context of the node with the FMC compatible string, referring to the
> > FMC's watchdog and not the (separate) SoC watchdogs. However the FMC
> > does have multiple watchdogs, one for address mode detection and the
> > other for ABR. So maybe the name of the property could be improved in
> > that regard. I think it's still reasonable to have watchdog in the
> > name. My immediate reaction is that "aspeed,abr-disable" overstates
> > its
> > behaviour. How about "aspeed,abr-watchdog-disable"? Previous
> > suggestions were "fmc-wdt2-disable", and the current
> > "aspeed,watchdog-
> > disable"
> >=20
>=20
> I like both of these: "aspeed,abr-watchdog-disable", "aspeed,fmc-wdt2-
> disable".

Alright, let's go with the "aspeed,abr-watchdog-disable".

>=20
> > >=20
> > > Also description of it in 14.2.2 Alternative Boot Recovery
> > > Function.
> >=20
> > The second bullet in that section says:
> >=20
> > =C2=A0=C2=A0 When the firmware booting successfully, it should disable =
FMC_WDT2
> > =C2=A0=C2=A0 to stop booting switch
> >=20
> > This is what Marc is trying to achieve by providing the property.
> > Other
> > platforms may want to make the choice elsewhere.
> >=20
> > Andrew
>=20
> I'm not saying that is Marc is doing something wrong about it, I just
> want to say that need to distinguish WDT2 and FMC_WDT2 because it
> puzzles when you reading the code in which you see something like:
>=20
> /* FMC_WDT2 ... */
> #define WDT2_ENABLE ...
>=20
> I'd be use exactly what it should be:
> /* FMC_WDT2 ... */
> #define FMC_WDT2_ENABLE ...
>=20
> and everything else which relates to FMC_WDT2.

Understood.

Andrew

