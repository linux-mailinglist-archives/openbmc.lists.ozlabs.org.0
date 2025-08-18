Return-Path: <openbmc+bounces-475-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2717B2B33C
	for <lists+openbmc@lfdr.de>; Mon, 18 Aug 2025 23:13:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c5QRQ6zt5z3cjG;
	Tue, 19 Aug 2025 07:13:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::931"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755551586;
	cv=none; b=kzilLXPq/4+Ye+X1rm2LyjV2Ch3YsEDXQRzbgYqBuKoYmz7U7vT2w0eO2xpBLH1KZ7z2gOJCXCdQ14UZeDGdBWY8/0UtMuAox002FkbvLATggkG5knIPAMvsVzeD3vNuBRG3hnBfydBKUjx84JTfnFvjYf7HmzqIXx7cvjLtxIt1IaD98B+Shl8zySnteeQJyBKIP8StHbbGJr+q251Z1QRdvn3Rs1Ctu4Pf0/xHfxKR8GvJ/FEANr7WBPCgML++Wl6yH2OcHmA0gEBuE/+BzrBYlw/HmOdvpr+lq/CS7r3FzPciLVb+2W9JEzfCQNzvdiikbVucQfggAYNDafnrfA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755551586; c=relaxed/relaxed;
	bh=D4MMfvF9J4Kx5ccbhLUWwKjCiHyFQfFE/NVFRowRDrI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QLef4jXDFBcoaLYkRpFgGJZgudmQfVyllzCpFcOvl8JEHP6mS379PHNWHxAutOplZZkczh9qjjS3+/c/jxXfpTIq+hlUk4yC/+8XPpsc5/igxoIMzG4qU4kvOYXb2UWXDNCmWucO6l6RdM9vBx1SQXJUqWSEtcMJOtvOeT3I/6h/6zKxDxbo9ppkXtFil6u6GvNWUeNUJmfDKTrqbx2AtqgbzG6RYLV+iYa0aAPRrZujv+rgxortov7vzs5mecdQ5Gs5vSRiWp1OqdzThQstG6oo3R0STAYyBbQmg+QKOtayM1nvngx/IPIYxlGM4lJ6DOWXHdf47lpF0dnpJ3EksQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WEqfjBmK; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::931; helo=mail-ua1-x931.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WEqfjBmK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::931; helo=mail-ua1-x931.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com [IPv6:2607:f8b0:4864:20::931])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c5QRP6JLBz3cj7
	for <openbmc@lists.ozlabs.org>; Tue, 19 Aug 2025 07:13:04 +1000 (AEST)
Received: by mail-ua1-x931.google.com with SMTP id a1e0cc1a2514c-89018ec3597so2837316241.0
        for <openbmc@lists.ozlabs.org>; Mon, 18 Aug 2025 14:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755551582; x=1756156382; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D4MMfvF9J4Kx5ccbhLUWwKjCiHyFQfFE/NVFRowRDrI=;
        b=WEqfjBmK4Y/bqUVSG0wDECenMnEYfPrafprMPjoPNp1b9tnm8mVsnIzm9yAVVPxYZJ
         E7q4By68c1h4oZ8PM9sRBNe/sP4ck58Ja4QNLCRHbQYto2TcWqYQrbN9TV1ScE1tXdgK
         fH8RfzytyCKZsVlLGN+hkvqDIC/FEH/oGDy2G2bnT4+N6CDO5PmK2S1FKpQmz+Jn0Wgx
         gT/+zUDatAHQmzZzFRZXkraP+L9yMbym9iVN2NGConeP1CVmohb3zRcuBFe8Q2v14KY7
         QX8qhMOWuMu1hNkIH8GFLyd+An66bDZTxdx1ds/jyqYuaOt/tleczeQFSHoMSkVeR8Nq
         +X1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755551582; x=1756156382;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D4MMfvF9J4Kx5ccbhLUWwKjCiHyFQfFE/NVFRowRDrI=;
        b=AiXNHw98xAhjEjXKcMCHuzljhd3W3IqEA9jh2KAQuxTdDt8nJXmbKlFtGJ+uTj4zif
         s78bJsL70VQELXtFJAik1RZxIGvgB1K926rM0nTh6b0MhIO2hjc/tQWkrHU4mGjpk4gZ
         dwpaZcGVBJRxWM+hpt/eZOn99Z/PxhfHfbsEr9eDweKsgsI8lt+ccQcCEoxxzq/c7PMh
         iFKKu7dLvOOF2GMshmWnUeufNN6rvMULgsu0Y/QlVJMsIdkG+nLdGlywvI1a/KYEydrD
         cmLB8VF7i3XNPQuuaefMI9SbVmQLUmEOBmBd14HoonQOVOmA1ToMQ6uvZMhHV0pHCvpj
         +Njg==
X-Gm-Message-State: AOJu0YzArrWkXJBQyr1Ao/xiB1zo+aRVDmIU2LrcLUwI2CtBOWJOmSav
	jRprLiUFFOKPit4DaML5AJMk1u9PtiPdPtCjqqEvIk2bPIIpoXz5CtKXH1BVfNqnveXc25vLt5j
	9Bs5lrds5/cm0CupcZHqrftLQQ+9HqsU=
X-Gm-Gg: ASbGncsprlmCeIJOVbY8WSgFQg0jNe3KRIHwlZe6AEoY965u5v2D9XjppX7HsY87rNJ
	BL2m3fTc/K4avQh/lFjGKuMsZUGoRFM6ekllzMRdDSsBNbrJmhruXzcEfFttUXtJNM0OuWiznc4
	DGglohWnaoeqsC1e6R2CE4ylPJfs8o210hGoF5Pye9LpPhBuM5EB+ytBhvOH4TDL8gBjsYidYMi
	34mImU4G2ahAg==
X-Google-Smtp-Source: AGHT+IE3h47sKi5Tqo0sRoYkXFtOR1zySjnjIFidTWEqWqSDVf/t4gMYWJ05JuRhLGt2vxyt318h1GEAIiBtma+vp04=
X-Received: by 2002:a05:6102:5a8f:b0:4f9:6a91:cc97 with SMTP id
 ada2fe7eead31-518f82a5addmr255715137.27.1755551582227; Mon, 18 Aug 2025
 14:13:02 -0700 (PDT)
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
References: <aKOKlY97pOtfuaEv@heinlein>
In-Reply-To: <aKOKlY97pOtfuaEv@heinlein>
From: Andrew Geissler <geissonator@gmail.com>
Date: Mon, 18 Aug 2025 16:12:46 -0500
X-Gm-Features: Ac12FXwXVD--5OIPVQZG18Y7p4yC6UZzeQb3av0oKtOLgPusnimFx1B5mj_WOr4
Message-ID: <CALLMt=pYenWUkiPBwdQgLB69aYOkdBk2-_zmSC=A74d+i2rd+g@mail.gmail.com>
Subject: Re: TOF elections for 2025H2
To: Patrick Williams <patrick@stwcx.xyz>
Cc: OpenBMC List <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Aug 18, 2025 at 3:18=E2=80=AFPM Patrick Williams <patrick@stwcx.xyz=
> wrote:
> For this half, we have 3 seats up for election.  Currently those are
> held by Andrew Geissler, Ed Tanous, and Manojkiran Eda.  All 3 are
> eligible for re-nomination / re-election.
>
> Nominations for those 3 seats may be sent to the mailing list by
> replying to this email.  Only those eligible to vote may nominate or be
> nominated.

I will re-nominate myself.

