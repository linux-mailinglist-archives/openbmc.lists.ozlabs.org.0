Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EEFB6C3F06
	for <lists+openbmc@lfdr.de>; Wed, 22 Mar 2023 01:20:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ph8Hy2FGnz3bWq
	for <lists+openbmc@lfdr.de>; Wed, 22 Mar 2023 11:20:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OtLuND8w;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com; envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OtLuND8w;
	dkim-atps=neutral
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PdTk16890z3bY0
	for <openbmc@lists.ozlabs.org>; Sat, 18 Mar 2023 03:15:03 +1100 (AEDT)
Received: by mail-wr1-x435.google.com with SMTP id l12so4923365wrm.10
        for <openbmc@lists.ozlabs.org>; Fri, 17 Mar 2023 09:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679069697;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/+ZMtt2tNQNA7w5Hxe1OjrVVL6nDbw/jp+A5wl86/aE=;
        b=OtLuND8wUCOdMCeCSPpjPCISeauWMbM5zf+pfaCASm06tGhcI4nnffE50aT1uGg3jj
         ovYqmSMvkAPCxnuiGOQHQgCxCZeiEJEtxc4Bg/Bh/MhFDKKfNSrksg3i0jRm8IKrfEmR
         97S+mT2d7TyZe8d4+Ksz9V735NGfcyBPhWteGgSq0epS7tQkQxWwdQNKBmiVQvdLL93j
         0o7xOVcUXsxRHWj4c+ncOPuMbWoCxeMn/jMeV0uL72ShkQA5ia6VdfD7gA5uwW35rDZH
         h0I2NS2tBTz+6dKa+QMvv1mNuVRXudC+Hhk7k72iPbtQSPbUgdYdhulECxOwODlkBxWi
         YLZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679069697;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/+ZMtt2tNQNA7w5Hxe1OjrVVL6nDbw/jp+A5wl86/aE=;
        b=EQlU4LQjPOXwKxh4o2fK0k5jjNBwFmHlMHtXm7wLXYCXoLrwFj/d6gkxkgS/M288oV
         6cpuLflBD1M6+mdI8ugFMuzmzgpYqR8U+DjIhdcT0x/mPvvezK3/N+YDybKmHPMrQb/4
         wNImS54Bq9K7mjLI4eh2i2YMFn0e3Y5t85BBmSUn81fQOzjw4w47bJLiFfkq7owX2X8G
         3x+DoR9TeUS29mp2tZ/yiHIgfzG7ncp3HkCw18oWnHQMdZb+1cdV91ir+xWq0+qXRI0b
         ICkkTikjEwdXTYzvxvaZ6CjE+4HIUfoXlj8pfJsh+JmuOm563/VWPZV9okPayts05O6s
         7oeQ==
X-Gm-Message-State: AO0yUKUdXDx12h+7Eb6OpJqrKbR8qPa9QZkd5R8jB8J7H39r9GdxgRPm
	AHEAiaNL8J5rp0+f1UVNireKLg==
X-Google-Smtp-Source: AK7set+OMnrvtih7O4O01XbtsY4TcpuNvxytzbt2AitwwDgp32YeS2etvGBT79MtszPTPqsQaRghkg==
X-Received: by 2002:a5d:4ed1:0:b0:2ce:a944:2c6a with SMTP id s17-20020a5d4ed1000000b002cea9442c6amr7005974wrv.70.1679069697633;
        Fri, 17 Mar 2023 09:14:57 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id u13-20020adfdb8d000000b002d2b117a6a6sm2295879wri.41.2023.03.17.09.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 09:14:57 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 076B81FFB7;
	Fri, 17 Mar 2023 16:14:57 +0000 (GMT)
References: <CAJ1un7j0FNpYaaviQxoKQN4O+C8RejqA918CdBamPySKyAEJUQ@mail.gmail.com>
User-agent: mu4e 1.9.22; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Abhishek Singh Dagur <abhishek@drut.io>
Subject: Re: Using QEMU how to redirect serial /dev/ttyS2 output of guest
 machine to host machine.
Date: Fri, 17 Mar 2023 16:06:43 +0000
In-reply-to: <CAJ1un7j0FNpYaaviQxoKQN4O+C8RejqA918CdBamPySKyAEJUQ@mail.gmail.com>
Message-ID: <87mt4b73sv.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 22 Mar 2023 11:17:46 +1100
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
Cc: Peter Maydell <peter.maydell@linaro.org>, openbmc@lists.ozlabs.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org, =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


Abhishek Singh Dagur <abhishek@drut.io> writes:

(cc aspeed maintainers)

> Hi all,
>
> We are using obmc-phosphor-image on an ast2500 board which is trying to c=
ommunicate with other devices
> over serial port /dev/ttyS2.
> As we are trying to emulate the machine on qemu we need to redirect the r=
equest to the host machine so
> that it can handle this request and return appropriately.
> We tried using QEMU options like -serial ,-chardev but still not the
> concrete way we get to do it.

Yeah I'm afraid its non-obvious, certainly for built in serial ports.
Try something like:

  ./qemu-system-aarch64 -M ast2500-evb \
    -serial null -serial null -serial chardev:myserial \
    -chardev file,id=3Dmyserial,path=3Doutput.txt \
    $MORE_OPTIONS

You have to add a -serial for each serial port up to the one you care
about and then set the chardev for it.

If you where adding a device to the system then you can explicitly set
the target chardev for it with something like:

  -device isa-serial,iobase=3Dnnn,irq=3Dnnn,chardev=3DID

> It will be very helpful if you can provide us some guidance on this.

Another quirk for the aspeed boards seems to be the default uart can be
an arbitrary one depending on the board model:

334:    aspeed_soc_uart_set_chr(s, amc->uart_default, serial_hd(0));=20
336:        if (uart =3D=3D amc->uart_default) {=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
1112:    amc->uart_default =3D ASPEED_DEV_UART5;=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
1407:    amc->uart_default =3D ASPEED_DEV_UART1;=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20

as a result ASPEED_DEV_UART5 will always be the first serial port
(serial_hd(0)). I don't know how Linux numbers them but worth being
aware of.

>
> Thank you,
> Abhishek


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
