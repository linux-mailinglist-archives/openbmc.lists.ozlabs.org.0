Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA35796914D
	for <lists+openbmc@lfdr.de>; Tue,  3 Sep 2024 04:08:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WyTYN2qV2z3cC9
	for <lists+openbmc@lfdr.de>; Tue,  3 Sep 2024 12:08:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::62d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725329285;
	cv=none; b=I3QnasSsTGMjrc4GW8MFADhX0S+jFAH8DOG1Bo8sgjCLz2cAT56geImB+O/EhLbOEXYdH64yD7xSqFdhOnRdi7d09JrD1cr+CMDHxqzQTPYNicbdZpbSEu+2vIX3SZ4WjmAejzE8qFdCYxylg2MyRBc1fOeZrVMkAtiaem+OdRlJf+Qde0KrjE4KAAKMl5dvVra3J7s6iXvlNfCbneNre55pKKB1oIA+nkhyd0kvC3PBq6fHHfXPTiAM6xXOKaXh7jeTY59JsSCmltJC3kt9PbB2v4YuKQaotSJLI/PcJN/PprqtY8bre0YOVCoR8QyKwknkdw1ns56DxeyMIcjXcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725329285; c=relaxed/relaxed;
	bh=T1GuxGVThsSRhyDuyn4cmCRQjYF0xXBu34+O3FRfXrc=;
	h=DKIM-Signature:MIME-Version:References:In-Reply-To:From:Date:
	 Message-ID:Subject:To:Cc:Content-Type; b=C/IgfGbkkwBChvpPfCnFLVHSyWDjy3J6/gIQcLobQCcPGON1Gv2ADS74tpzpBvJknjJUKw2KU9ZsrwF4eCdnARUgoDTfW46pRRSIg2PDcy/PBkGOv/XZzPb6zF03QQVhg4eIKUzHl9J9pFVS+BSskaUdXa/S6LX5vb4VqKnvHoV/ZizblWfyWTpujxsRcbazip/HEhT6nN+ZJhuBrDLXCnOZn4eETOU744Tf+dmIqdi3UcXtAC/ZMVReJbJUd8UfFIcCrRUriGD1raGm2AVUgwkXsr/lxpispZ47YhZbljbn2+hYIfTKWd5NrHPHwaq3321Z12ZfYJYTSTsQPLM2FQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=keljqYv5; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=keljqYv5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WyTYJ0zvlz2yDM
	for <openbmc@lists.ozlabs.org>; Tue,  3 Sep 2024 12:08:03 +1000 (AEST)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a868831216cso548148366b.3
        for <openbmc@lists.ozlabs.org>; Mon, 02 Sep 2024 19:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725329278; x=1725934078; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T1GuxGVThsSRhyDuyn4cmCRQjYF0xXBu34+O3FRfXrc=;
        b=keljqYv5ZhqN+AbO48ytcSPjfGgHoudRardBusz34nPCTaufV2QsKEd8o8gP7y4wYg
         TXjA0VlMBT6Y94oHW7qjcHrDzagV8zPftq+2x0GRRwfzoNAI24scODGmsDzWLwSGTC+S
         ZyP7IELmhqf0In/9/hWSo4NH5XEgAQMg//YJ82ycujCLAGmyYBzrZsbIAxsW37gzmvNd
         bTgIQ6DtlG84ghq8MBmyyDLT1GgQ9Og59Y2L3Ispqk1CjQ67z1Aj4/avEZOxtzZHkJq3
         QvCXj5vibK8TilcYiQJae+Ec0bsUpol1ODg2reCQ0PR2kVo9mbIo+XT9qSmDNrT4H7Nn
         fWRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725329278; x=1725934078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T1GuxGVThsSRhyDuyn4cmCRQjYF0xXBu34+O3FRfXrc=;
        b=DisYkarl3iFAzNMQPh4imBGU2Rdh7djSYwuKdwo7rmgJUnVRDPRjzVja74Ab5AdxBj
         7j6X4X3F6jg0syZuoFAGKLQUtV9JaGZk39wtC93BhhKUO//ovitdk8BoN4ornCUbbcls
         FGtZKGgt9kkIwRw+fsXHrPmtB6yHU5LjqbnapUHmokfrpVCG7qvVoG8BN0H1btSuqKQL
         El5T7HbtQ9zcOIhiiZdL1WnNg1L8w+GKI3my5XD94GuP8kDBtufmo9pujhyBCTWkBT6S
         wde9RZpb6urZfXeUG1TfToO7+DrKd2WydQCjFiMot95EryoF/GlxemkzCiAlegoSMP21
         5BPA==
X-Gm-Message-State: AOJu0YyB1X+7QWkfgmDtDd0D8L9nwp1kDK4EcYmGjGbN2jea7Sh1xABi
	hlgZMrbMss0TRP/S4Lv7V98dUOQ+A+XsDlyh45tGOWUOtAgnT7UPHXgPY+ltEoaLyUkJFBKgoMq
	HUlgX/AEsANduK1DC2eS4zk77Wg==
X-Google-Smtp-Source: AGHT+IGrC74Ctz0HzdIiD7tPawwv+UqDvOFvoUGHiH77vBFIYeFjLsTp/nj7HnVFDEBLZ4qvEkvOCGuZe0mvz2lIzBk=
X-Received: by 2002:a17:906:f586:b0:a86:8917:fcd6 with SMTP id
 a640c23a62f3a-a89b9733607mr529621766b.60.1725329277088; Mon, 02 Sep 2024
 19:07:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240830034640.7049-1-kfting@nuvoton.com> <20240830034640.7049-6-kfting@nuvoton.com>
 <ZtIaofiTqyFwNXrO@smile.fi.intel.com> <CACD3sJbZ-Yy3PfPWisMSiPYCbztbi1+Q+=udMG8EjNvE+xA1mg@mail.gmail.com>
 <ZtWnd8bmiu-M4fQg@smile.fi.intel.com>
In-Reply-To: <ZtWnd8bmiu-M4fQg@smile.fi.intel.com>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Tue, 3 Sep 2024 10:07:45 +0800
Message-ID: <CACD3sJass-6gu6MQxrYwLGi6OMgWnntO+N7Ob9nV6o3siFHNVg@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] i2c: npcm: Modify the client address assignment
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, avifishman70@gmail.com, 
	tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com, 
	yuenn@google.com, benjaminfair@google.com, andi.shyti@kernel.org, 
	wsa@kernel.org, rand.sec96@gmail.com, wsa+renesas@sang-engineering.com, 
	kwliu@nuvoton.com, jjliu0@nuvoton.com, avi.fishman@nuvoton.com, 
	tali.perry@nuvoton.com, tomer.maimon@nuvoton.com, kfting@nuvoton.com
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
Cc: openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andy:

Thank you for your feedback.

Andy Shevchenko <andriy.shevchenko@linux.intel.com> =E6=96=BC 2024=E5=B9=B4=
9=E6=9C=882=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=887:54=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> On Mon, Sep 02, 2024 at 09:40:09AM +0800, Tyrone Ting wrote:
> > Andy Shevchenko <andriy.shevchenko@linux.intel.com> =E6=96=BC 2024=E5=
=B9=B48=E6=9C=8831=E6=97=A5 =E9=80=B1=E5=85=AD =E4=B8=8A=E5=8D=883:16=E5=AF=
=AB=E9=81=93=EF=BC=9A
> > > On Fri, Aug 30, 2024 at 11:46:38AM +0800, Tyrone Ting wrote:
> > > > Store the client address earlier since it's used in the i2c_recover=
_bus
> > > > logic flow.
> > >
> > > Here no explanation why it's now left-shifted by one bit.
> >
> > The address is stored from bit 1 to bit 7 in the register for sending
> > the i2c address later.
>
> Yes, but previously it was stored w/o that shift.
>

Previously, the address was stored w/o that shift and with that shift
in the following call to npcm_i2c_master_start_xmit,
just like what https://github.com/torvalds/linux/blob/master/drivers/i2c/bu=
sses/i2c-npcm7xx.c#L2043
shows.

Since there are cases that the i2c_recover_bus gets called at the
early stage of the function npcm_i2c_master_xfer,
the address is stored with the shift and used in the i2c_recover_bus call.

> > I'll write some comments about the left-shifted by one bit behavior
> > above this modification in next patch set.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Thank you.

Regards,
Tyrone
