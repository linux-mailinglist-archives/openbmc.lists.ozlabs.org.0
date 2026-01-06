Return-Path: <openbmc+bounces-1093-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5515ACF8E32
	for <lists+openbmc@lfdr.de>; Tue, 06 Jan 2026 15:53:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dlvLc2ry1z2y7c;
	Wed, 07 Jan 2026 01:53:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767711224;
	cv=none; b=IjLapX/LvMzjgt2xZQIqxQio5CTJlZe9LTF3GIKeqXPO2MVzVMEm976Q1p0CTURZnjLnCTtiRoDriJ5unc83LvdMNyRG8HVCZy3TuZIioK2N3o+DojyYyKEh6xzfC3WZASIaypbpIuwjc5M0NFjErIGQ8TDyuULiy2YnUmnQTOZJ7R65uWuJOVP+6o5UwU4bIqq/wJ63lrs6eDJifTSk7Xoot1YYscKebpH1irYL0daDwMR/VjuCZwqMvrXp2hPdMZMv1llKAQHycacPGEOIP3mq6e6i7sCM392M7doT3MFy54AC0CXe48RQ9MwfJNzqXDD87kGELY4x0SeslbFa1w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767711224; c=relaxed/relaxed;
	bh=ORBsimEennCXXG3hZl0fD2v3IeUphWKDEX2/zqn/RrA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TElk1mv5upDzfrbKeBVo9gNvqZPwWthpzQYMWupXM2L2YE4elrhNvGRf84tqi23FGmPfzrommNTLs6GJ9/88X4llQZ+Zi1WDb20gm3bACqXMBcV5EkiVziEDM/3S7SJhm9fGsrWZ++D+Py9u/o/iyLIbgmeCsmoUNH66jRGSPdiMX0rrXMaYbK1wEX8lLxhb50gD1Dyrk9vR6fsuwULAHqLL3O8y5nqBI4n7pcj0XZV+RhzjKBO8ZNeNkyc2oUcF1xrJawc75CqQLcVrFYhjVLqJDG7FFHr5Y0ympa9+TI5m7OQGxvEZSnM5Dh3/uvdttihHM7J/3SHwXMQejYJsTQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YSkbjzOx; dkim-atps=neutral; spf=pass (client-ip=209.85.214.169; helo=mail-pl1-f169.google.com; envelope-from=fr0st61te@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YSkbjzOx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.214.169; helo=mail-pl1-f169.google.com; envelope-from=fr0st61te@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dlvLb11sFz2xPB
	for <openbmc@lists.ozlabs.org>; Wed, 07 Jan 2026 01:53:42 +1100 (AEDT)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-29f30233d8aso11413855ad.0
        for <openbmc@lists.ozlabs.org>; Tue, 06 Jan 2026 06:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767711161; x=1768315961; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ORBsimEennCXXG3hZl0fD2v3IeUphWKDEX2/zqn/RrA=;
        b=YSkbjzOxD4xlZDlWcwr3Sbtzx2RVprPkGAGXaMDQ/o7kqMkMfOHI1ewCZlllzcehvq
         NctOlj7GFRr7qM6a6JGEVuH/ybEEVcMhUVU10pNJTogW0UbMmWYf65IAdLPnoaGryeOp
         RSrKCSiVLH3Z+oz3y/0L+Qn4Q9PejER2hZtz36LbmS0JMR286OHzkexRZOJ1opeIIc3K
         18MZGRMUrljTdOJ4MVwNRtuKqwK3utt7fopitkGMWrzi4PFMAtQ1o5ldtFPa6mJtLK3r
         iLozs+ve2kftmzELs7LJn7aoXAHadMCSO/JscKmCKC4m5+GgkWDqqIwSnDmelPWk4mwf
         2OBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767711161; x=1768315961;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ORBsimEennCXXG3hZl0fD2v3IeUphWKDEX2/zqn/RrA=;
        b=FOLTnjAGXXUAgLfxcyiirPWtASlWqyzWLVmaX5uZ1/6nyK3yEMjl42f/Vk9+jvAwU7
         XsSlPsygHo++vWvgseXTyUnhuNsFxM3IStZ68L+5R1mXchEQe/Qu2Gp28qRUbJKS2y1I
         bhtMzkbyD8ZLT2uTzkBPU/0zl00M5XtcDDDH3YMn1h5GBBYVrI/NbNZcuAIS/Rd7rT+M
         MCTwBy27MtMBaMpBH7TyjXTbWJpD8Y9L1s4XnWCE1D5/e6DHYgMqGTEagfVe88gFzrzN
         mhoi28r06kt7VfjR5ftHKmCzaMuyCGcbiKoEnBu5WDwcRMyrfEzLgfAmLGkAuMjmtrTm
         sWLA==
X-Forwarded-Encrypted: i=1; AJvYcCXT/8U5qc87wQaQpJw3C2CvUqMqearexgSVWlLYIj/5YbRp4/BiphBJOJCUtRAxMWhI7TxqPvn1@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwDIwioWYvoI2UQrMkl2PXykNXOVTkGm2+7gWzjXgGDA1Ncu7Di
	GVeyHJ3CD2+5gGMth/5XkHHgtW7jgIEsGJKMnuJ7VUUGweepl5zzf2so7+I6P39vwjDu7qgUkfv
	DbwT65baLFqz6eIBQRR3TFRoROG5Ic48=
X-Gm-Gg: AY/fxX568zcSiolFKFxhXNqnxmaVuoauiDp6kG2azBbIz559HbCKz9NeGX77LOMCQcW
	QF2/UYeWZVtzakb7LEWYHXyA0idH2/lOvX/bLdc+aYVCmrJg/tJ2HQNgKeAcK7B0A+SNmg4RgyZ
	LCRvqDj5E1JBya/CAQrb8BaqWTSKsAHkvs6KvZJUmNs1qbfzPeOnSmZfi2DPneaBX4KuZ6lbyQZ
	9CrMZVKx2t7RDDrXVBHu1/oTKwjjgIuhlPBw+v3PZ2HkKaVPKoCs0Qq+ZfoGcWJNtiGZ+J0
X-Google-Smtp-Source: AGHT+IEFOjicsYgC7WoEUcD9kWk4BLnLh5ewZBGUZSRpLQ8nH2uolRvD3RxhXAQZC2djr/q5xHqn+dferID+6di1bOc=
X-Received: by 2002:a17:90b:134e:b0:34e:63c1:4a08 with SMTP id
 98e67ed59e1d1-34f5f32e632mr2644551a91.20.1767711160550; Tue, 06 Jan 2026
 06:52:40 -0800 (PST)
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
References: <20251202-msx4-v2-0-a605d448bd02@nvidia.com> <20251202-msx4-v2-1-a605d448bd02@nvidia.com>
 <CAKkNK0JOPAyw8HA0XnD836d115p5YBbo=uBD9eXXvByzCv92Yg@mail.gmail.com> <aVxRrM14yN3YZ6Xo@molberding.nvidia.com>
In-Reply-To: <aVxRrM14yN3YZ6Xo@molberding.nvidia.com>
From: Ivan Mikhaylov <fr0st61te@gmail.com>
Date: Tue, 6 Jan 2026 17:52:29 +0300
X-Gm-Features: AQt7F2q7nF6STE28q-piDJ9t2PIGArNkbZVqanVG0hD4sTZXONdvtXG1KL147dg
Message-ID: <CAKkNK0JGjmurZQ4C5jnOBGAig3n24xr4FAxHpyvqWyTTTHW8eg@mail.gmail.com>
Subject: Re: [PATCH u-boot v2 1/2] drivers: spi: Add support for disabling
 FMC_WDT2 for aspeed
To: Marc Olberding <molberding@nvidia.com>
Cc: andrew@codeconstruct.com.au, joel@jms.id.au, openbmc@lists.ozlabs.org, 
	eajames@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Jan 6, 2026 at 3:05=E2=80=AFAM Marc Olberding <molberding@nvidia.co=
m> wrote:
>
> On Sat, Jan 03, 2026 at 12:24:07AM +0300, =D0=98=D0=B2=D0=B0=D0=BD =D0=9C=
=D0=B8=D1=85=D0=B0=D0=B9=D0=BB=D0=BE=D0=B2 wrote:
> > On Wed, Dec 3, 2025 at 2:53=E2=80=AFAM Marc Olberding <molberding@nvidi=
a.com> wrote:
> > >
> > > Adds support for disabling the ast2600 FMC_WDT2 through
> > > a device tree entry in the fmc node.
> > > Set `aspeed,watchdog-disable` in your device tree to have
> > > the driver disable it.
> >
> > Marc, FMC_WDT2 doesn't disable watchdog, it controls ABR mode.
> > Watchdog with or without ABR still in operational mode.
> > So, maybe aspeed,abr-disable?
> >
> > Below namings probably should be corrected.
> We aren't disabling ABR mode with this change, right? That's only
> done through hardware straps or OTP changes. All this is doing is clearin=
g bit 0
> of FMC64, which per the datasheet disables the watchdog. The idea here is
> to just allow boot to progress normally, without the watchdog. For ping p=
ong update,
> userspace can flash the alternative SPI and re-enable the watchdog timer =
on complete,
> and the BMC will boot from the new image upon reset. Let me know if I'm m=
isunderstanding
> your comment.
>

Marc, when you clrbits_le on FMC64/FMC_WDT2, then you disable ABR mode, I
assume you can check it with evb board or ast2600-a3 to prove. On my board
ast2600-a3 it works in that way I described with enabled OTP strap for ABR.

Also description of it in 14.2.2 Alternative Boot Recovery Function.

FMC_WDT2 & WDT2 as far as I know are different, you're not disabling
WDT2 with disabling FMC_WDT2.

According to the spec, it's right it disables/enables the watchdog with 0 b=
it
but which one. Probably FMC_WDT2, not WDT2, and it still works as should an=
d
disabling WDT2/WDTX in different sections - WDT0C 0 bit and WDT30.

Thanks.

