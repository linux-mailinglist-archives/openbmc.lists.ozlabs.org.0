Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A869BC117
	for <lists+openbmc@lfdr.de>; Mon,  4 Nov 2024 23:50:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xj6BH2mfSz3cgt
	for <lists+openbmc@lfdr.de>; Tue,  5 Nov 2024 09:50:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::f2a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730708442;
	cv=none; b=dF5bbSY6NlK+MSYlkW1lor2xbyMSpjOGWSeM3n4kwrNJ33g7WPngXVGaCbDnr+qF47WyECgo6WL//z7JvKg649ZhIE8umtJg0RmSz+tf2Blqnn5DIW6Bk5rmgRmvZDcooJPhToSJFPbZ1eXWapmJcClyXoeqEHIUWn0SnXh/q4wK/iCnfjZCqizc41cx1c9EoxNAkK2ZKi9n6IgWgUV1YPXAqpCuDZnJFigEHZS6zG7whVoLSuPQ6LUx4wbVXU12afLWBQbzI5Rn/aZtl4bHfdvKmAtdDCv7B4BNppzB8seXjVg/qC9jcrRLCjBHr/UXc1fCt4iA7Mm9fn3hcR567Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730708442; c=relaxed/relaxed;
	bh=p1jVXbPTVzBsjqPi6FFutxVJsnea7PWQ8s+9/ntA9tg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kUwgjUupZf62AXabTPZg8V7E0yje41oqrJt6XMSmQEivR6x59lj9lh2+qnMjlxbjk418hZY401S4GzNXCpoNrlVWqwHE1DMnlOBa+0ttSmNvhJk0mfcJ6rl8ms311qjJmR9W8bsjMbXXnvrJ4RS39jFodc1FbmISjcEsBCr+sruqbHOBMDDUekz/MDHaMoO9kjBOjVIUkZTC+VWI/Ndxsiv/qdq6L9n8c7t28gy/XOG4nsRUtLK6spyRFw0KS7boMUNZ7LrVFtVuUNnItpn9wo0ecarKAoSQETqulnYdEaoZLn2UpT5B7gHYmhrbys0zGX5unQTQm5ekDIJmYNqVzQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TLPm3qw8; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::f2a; helo=mail-qv1-xf2a.google.com; envelope-from=baneric926@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TLPm3qw8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2a; helo=mail-qv1-xf2a.google.com; envelope-from=baneric926@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xhktd5tXBz2xG6
	for <openbmc@lists.ozlabs.org>; Mon,  4 Nov 2024 19:20:40 +1100 (AEDT)
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-6cbf340fccaso31933356d6.1
        for <openbmc@lists.ozlabs.org>; Mon, 04 Nov 2024 00:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730708436; x=1731313236; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p1jVXbPTVzBsjqPi6FFutxVJsnea7PWQ8s+9/ntA9tg=;
        b=TLPm3qw8v4oDIA4PI8Zp08yKFTGZsuhCVDuPox+Mqi5t4WruQvYJX2ZMuKIqzlmn86
         tqFjRrv7Ekr5UcWiTz/FZpk3VoG/nGlxyWasvORDBNayqaX46/CaZPVYC+KDocA7QBRI
         TxM7mlybriRxjitxUvhWEkV9V/wGScA3shmhVHmsiWt66IGDGo/HXG9cfyFzXL2wUarl
         7vnq+6IvHp9ViE7wg5E51kIbZ96edN6QH45KVOeWowTxUmNfrMt2Ipw/1dtLjyVSmYd/
         qtr8mS4CwZv9t7Ks0JAWHbJFvbHxo6KVgkVj0hE5WlCdWq/y6aBq7yE0zS6PC1hkFDW8
         3pBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730708436; x=1731313236;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p1jVXbPTVzBsjqPi6FFutxVJsnea7PWQ8s+9/ntA9tg=;
        b=T4ZqNwexhuQwEPZgRlRNIvZ2Zx5W+kFdBB7MAuDnHSiLxQ5/Wn/UV+dT0O6ewwo1Fc
         j4/Q3jnkY6ScIjuRO8hqodzpMMTeVZDiIBTWJSZUEkNMS2vney/99kNoyIGri+jVPXPX
         6LLxIaIfRAk317s+SEcarrGiCXhuyu8OF+S1DNuwNkr//DSnSEyent/DhTxH86nWAECw
         jUD4HUKHILWGzTv56/asf9NbKmpBiyyfx6HpfEqDyf3RMbp0nmMkFSSOSFM/nwXhID5x
         jJOMefgaUcn1zUX4yHBeyWowNWZMbaH4xykYOsNFTzOzPfgKCSA4WXguJno4ouZgG+oI
         UpZw==
X-Forwarded-Encrypted: i=1; AJvYcCXbW1+kXxYywZLCVB4xgG0XtPIufPdF8n9uJv09O1lJx+FvmhTqADYf0Imj/yvZuzToJHfvHqFj@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzz9vPic6/fNrAnsvSf5KJeArOSvWPAH9mlObZyikHRYWM2JntF
	pSNKdQ7ZsTCU5XABy5jOYkMhIADXm9AA74ndeOK/JsUN7ozMTgM9AXCQiSFkryYvjgEMJDGWRMi
	5XAy5mPCWilslaFUPRLIqyjfoU58=
X-Google-Smtp-Source: AGHT+IHLgcrkYBUwDtz8eL6HLBbEFOCEwinDtbXkm6C8XHnjj2JY5Dc4znzcgnq5rs2Dq/efGZ+wJLDtRfgCTcX864k=
X-Received: by 2002:a05:6214:4a8c:b0:6cb:ef36:5fbe with SMTP id
 6a1803df08f44-6d35424a60amr251831156d6.3.1730708436288; Mon, 04 Nov 2024
 00:20:36 -0800 (PST)
MIME-Version: 1.0
References: <20241022052905.4062682-1-kcfeng0@nuvoton.com> <20241022052905.4062682-3-kcfeng0@nuvoton.com>
 <2339841b-034b-440f-83ac-139d95059727@wanadoo.fr> <f6846ac5-55ee-405c-939b-1199ea362fb5@roeck-us.net>
In-Reply-To: <f6846ac5-55ee-405c-939b-1199ea362fb5@roeck-us.net>
From: Ban Feng <baneric926@gmail.com>
Date: Mon, 4 Nov 2024 16:20:25 +0800
Message-ID: <CALz278ZtciLq3gVyB_66zNPDh+n2oypLOmVSUQq4yR5sO-CoNg@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] hwmon: Add driver for I2C chip Nuvoton NCT7363Y
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Tue, 05 Nov 2024 09:50:25 +1100
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, jdelvare@suse.com, corbet@lwn.net, openbmc@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, DELPHINE_CHIU@wiwynn.com, kcfeng0@nuvoton.com, robh+dt@kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, krzysztof.kozlowski+dt@linaro.org, kwliu@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Oct 22, 2024 at 11:14=E2=80=AFPM Guenter Roeck <linux@roeck-us.net>=
 wrote:
>
> On 10/22/24 00:20, Christophe JAILLET wrote:
> [ ... ]
> >> +    hwmon_dev =3D
> >> +        devm_hwmon_device_register_with_info(dev, client->name, data,
> >> +                             &nct7363_chip_info, NULL);
> >
> > return devm_hwmon_device_register_with_info()?
> >
>
> No, because the function needs to return an integer, not a pointer.
> And
>         return PTR_ERR_OR_ZERO(devm_hwmon_device_register_with_info(...))=
;
> would look a bit awkward.
>
> Guenter
>

Hi Guenter and Christophe,

I'll keep following this driver and check with these suggestions.

Thanks,
Ban
