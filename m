Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C42779E0F0B
	for <lists+openbmc@lfdr.de>; Mon,  2 Dec 2024 23:50:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2JrP0FNyz3g2H
	for <lists+openbmc@lfdr.de>; Tue,  3 Dec 2024 09:49:41 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::532"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733111899;
	cv=none; b=cuv4Gzr665gyBqsiluZRAizGezcnVXheUQqLCsheAlD5k+gJVtb8NBqOHMAh1eHZNLyUO1OUj5sVbfAhUG70bthJC+ee3Wypy7kBUyOD1UadvWEFw/RmHD9GD3Jp8uLm75ClAjB32buTdvTyh/rnLMEGNuvc1196QDgwYP2kLBkovMvfbZir232M05GSMEhbi1z8T/BaJcyF7pvc/5vEk/p/HbVKWji2Eck/K4RzNunjL4r8aCHOZTZ5jY7ju6MFchO4PMTstlPqshIqH6jyuuMYqTAZ2NvmNAM8kSI1uoOkUeu6lTM7C2iy3jrwVvlCvcXVJxqGW4jCRGvKie69nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733111899; c=relaxed/relaxed;
	bh=1WuQ9zhPdvb7aTUSsoeBXQfnvNcWDdKLXzd31oeSilY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JmKWF98Q0KnG9aH8WPE+hSJM2uoGt1kFgir/a8p/YFGtYdGcZ/9zFlhjBtAgwXqJyDCbuUx9A0JDA9lNnSMBY+ApNJk0ZJJFXIl/kYKUn8kpJ60nDiN+2lV+IqaYiyS62GaK0YNCj02k0e4FYJEpYNxrKv0FoQegA0Kp8TkZVfDn7J3h/6hy8TlapKTLE7xBCEkstOIcmXON6t64qhTSkxTGwAsiiwk7xdFWUst1i2Fc7neo6Dapd5KMGPwqRpQJm960B0UCddsQpZ2YOtx06cNGtVfrP21AeblgpvVZF//fcS8J9Isw/Gzel9GMxW70OxbKpV/FX6Qj/Szu5Xg2IA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iD7cVTFh; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com; envelope-from=j2anfernee@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iD7cVTFh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com; envelope-from=j2anfernee@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y1qkw57bPz2yFP
	for <openbmc@lists.ozlabs.org>; Mon,  2 Dec 2024 14:58:15 +1100 (AEDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5cf6f804233so4495911a12.2
        for <openbmc@lists.ozlabs.org>; Sun, 01 Dec 2024 19:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733111890; x=1733716690; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1WuQ9zhPdvb7aTUSsoeBXQfnvNcWDdKLXzd31oeSilY=;
        b=iD7cVTFhFbqfKt0miKZ6/ukRwS9kIPnSgFOzSo4drOgXgdOtS2PGlEo8HdGWRc+GlY
         H3z166zrjz07erfCuYWtjR/JX5pkcz63IkCO0CSm7wJTyJuRkiUXYNVLmKHYqYkzZR09
         ayfrPpNZegXWyw1eJIN1IM1dDRZ1Ph6aSzFmz3UxB9o7Bb0vezCPilWdpha8iTP8ky28
         WnLz8z17yo4li5mwkGD538NEuVxc4nH5AfgIE2UBR/YNtwla+hgBWmOfTu1l31WOWMh6
         dg34zafhv8wEud3uaEaoKRD8ruDL16WDuJ31rjD0A4S7b3BP7ebyi63uuLKXFaxJ/E+u
         v+4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733111890; x=1733716690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1WuQ9zhPdvb7aTUSsoeBXQfnvNcWDdKLXzd31oeSilY=;
        b=dM8dh2FcJJ7axtJ8lAzOQlzZgsJtWkQTRqyE3BgsO72+NzjeBQJW8tD+hlFLdGtkIR
         esXRQCA60wMxoLNLdonjFLaugcJPaSj++mRTv3IL1ZvALiFzxMCqFQzY+wn/1KBPsBfb
         771hK12ko4OEl+24KbM0LnqSTkD6mj1P0s3WmmBcoLivrgGLnYoyb0cci0c6nV5YENcr
         8HtjokKrbpWtFiW0eZoj/UJRArisqD4zSSqqaziXcO2BHxA/tVH+Khdejqgz17QFsOqJ
         gcSLeMNsryF5nYjVAtrj7RnrFMb0CpBzqIgdDwPI79/+uOPin1LtdAUsG9ZngsQR79w/
         /6rw==
X-Forwarded-Encrypted: i=1; AJvYcCXVZ943kTYrdbGV9vxGjHwfPW77E+eIZfxX5OhTRdjl+TPzxJ7IXErxAFT513w4gGPNhvdW5FLl@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx6vAAoxLiRSITm4NHc6LaPV8e+WqfdvmHHFiOaXHn0nbm0jb7q
	q2cOe94i87kmfTz2kg1xeRIyU2J4pm6+4TNmmlOP14dKHuWSv9vrVbwGJHFH75EgmwZfXJwRJxK
	7O7iA3CvfE33RtdMUxicEXuoqF58=
X-Gm-Gg: ASbGncugFEidE2soeCMTV6fTQq3UUQbhtx8bt9eX/o9+cuRrPjR9TS8Fjc3bunOWQFt
	spnUw7JbTk28p2Iz5zVKfcAHBPKXG4HU=
X-Google-Smtp-Source: AGHT+IGwzEMbiiJ13Ofd5itDTOGLOFeo7dgalvpfbhUuXY2tP9DPIIZUXyvTnCRrUzAM/6rxs2ljWo1mX+WoQmAepyI=
X-Received: by 2002:a05:6402:280a:b0:5d0:cea1:931e with SMTP id
 4fb4d7f45d1cf-5d0cea19806mr7075150a12.23.1733111889614; Sun, 01 Dec 2024
 19:58:09 -0800 (PST)
MIME-Version: 1.0
References: <20241106023916.440767-1-j2anfernee@gmail.com> <20241106023916.440767-2-j2anfernee@gmail.com>
 <6c20875c-4145-4c91-b3b5-8f70ecb126f0@amperemail.onmicrosoft.com>
 <CA+4VgcJD74ar9zQCj38M2w8FzGWpq+u5Z7ip9M7a1Lu7u8rojw@mail.gmail.com>
 <20241109134228.4359d803@jic23-huawei> <20241109142943.3d960742@jic23-huawei>
 <CA+4VgcJ=8wDWWnmgEt-UkEUfnfD8kGtHe44G5+dcRYt=KdwNfw@mail.gmail.com>
 <20241123144750.43eaa1c5@jic23-huawei> <CA+4Vgc+rqnxne6saUgUO_kR6chX9+HZcb40_9dpO6p6KuskSAg@mail.gmail.com>
 <6d8e9512-2be8-4337-9791-0d956b0968c5@baylibre.com>
In-Reply-To: <6d8e9512-2be8-4337-9791-0d956b0968c5@baylibre.com>
From: Yu-Hsian Yang <j2anfernee@gmail.com>
Date: Mon, 2 Dec 2024 11:57:33 +0800
Message-ID: <CA+4Vgc+vXQYQubVs4eFJj+WuMKEJziZh44J_pXDxrmo_DXiWpg@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: iio: adc: Add binding for Nuvoton
 NCT720x ADCs
To: David Lechner <dlechner@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Tue, 03 Dec 2024 09:49:25 +1100
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
Cc: tmaimon77@gmail.com, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, tali.perry1@gmail.com, marius.cristea@microchip.com, yhyang2@nuvoton.com, marcelo.schmitt@analog.com, robh@kernel.org, lars@metafoo.de, benjaminfair@google.com, javier.carrasco.cruz@gmail.com, openbmc@lists.ozlabs.org, olivier.moysan@foss.st.com, KWLIU@nuvoton.com, conor+dt@kernel.org, alisadariana@gmail.com, mike.looijmans@topic.nl, Chanh Nguyen <chanh@amperemail.onmicrosoft.com>, joao.goncalves@toradex.com, nuno.sa@analog.com, matteomartelli3@gmail.com, chanh@os.amperecomputing.com, andy@kernel.org, avifishman70@gmail.com, venture@google.com, mitrutzceclan@gmail.com, linux-kernel@vger.kernel.org, krzk+dt@kernel.org, Jonathan Cameron <jic23@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear David Lechner,

Thank you your comment.

David Lechner <dlechner@baylibre.com> =E6=96=BC 2024=E5=B9=B411=E6=9C=8829=
=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=8810:50=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> On 11/27/24 8:14 PM, Yu-Hsian Yang wrote:
> > Dear Jonathan Cameron,
> >
> > Thank you for your advice.
> >
> > I would remove the "nvuoton,read-vin-data-size" property.
> >
> > Read VIN info can use word read or byte read, and other registers
> > should use byte read.
> > If I use word read for VIN info and byte read for other registers,
> > I encounter an issue when I use regmap instead of i2c smbus API.
> >
> > I need two regmap configs with val_bits 8/16.
> > After I call devm_regmap_init_i2c these two configs,
> > the error message:
> > "debugfs: Directory '5-001d' with parent 'regmap' already present!"
> >
> > Do you have any suggestions?
> >
> Give each regmap a unique name, like "5-001d-8bit" and "5-001d-16bit".

It worked fine to add each regmap a unique name.
