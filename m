Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B677793708B
	for <lists+openbmc@lfdr.de>; Fri, 19 Jul 2024 00:06:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iC+Wj2yk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WQ6Mw4fZ1z3fS9
	for <lists+openbmc@lfdr.de>; Fri, 19 Jul 2024 08:06:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iC+Wj2yk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b33; helo=mail-yb1-xb33.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WQ6MM4cvMz30fp
	for <openbmc@lists.ozlabs.org>; Fri, 19 Jul 2024 08:06:06 +1000 (AEST)
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-e035f4e3473so1355955276.3
        for <openbmc@lists.ozlabs.org>; Thu, 18 Jul 2024 15:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721340363; x=1721945163; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iVHZRR7THcCgNBSRHwpPAY6JMQ30xKqP1p4FN6RL5B4=;
        b=iC+Wj2yk+rL/mMAx2G96TQEOkomr0Ni8KTK9Pv5Gslt4cp32eCy/Xui70rdEqtdFwy
         RO66UFQwwepybCdKrnxdP1k37JTcEJjrGVV2AzvKO7JWrE3LSpGbknJPfiuVTl2bQ1lb
         uO2lkM/jjq5KSwVI23ngSGwBhuw58RxZGs+JfG1QyeCvraSNL5WUdSbFr14i873KGRYu
         PFhVHlkdUUkisFCHgWDlMjA62mCQqEvUntolK8RqqDiLIUpb3ClmBYt94m6FGgyTYjVi
         1+vR5EELaMi1mi+Rmlvz5hZWpnWZBRc1DbnlCUXJiO4A/hDwBywwgks8fLr/34f0uv1O
         o1ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721340363; x=1721945163;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iVHZRR7THcCgNBSRHwpPAY6JMQ30xKqP1p4FN6RL5B4=;
        b=wxoCf3W6HcOcAvDSjUk01TM8prs9udmNcbLk4qmd2HFopqbN/wH1Gd7VLIRLjyl/QM
         i9SqbAjDeZF//yo7y4Awab0VnmDQ6fhxaLoRgw9Izc2/8Xh8EUbAWMN9o5PVFigylD4h
         L5IjF9ZHauJI7iOBx/xat9GiTAPy5BBEiCSLaz417467aAdETM8fwYY7TYojSx9O4JYt
         /mh2hWbQSI49+sycE+L9eem8T1/0aZORnytwgV/+f1pyGiyT4GYl1vtHvRFNKHeaxPrI
         46Pwv0MNoorzAV8bDh4dVFaIvcfqyyQ9Wd51r9GpxW3IuWayKury3CBO6p3kADugS6PH
         +wLg==
X-Forwarded-Encrypted: i=1; AJvYcCX3IM+AbSyb8yq5lQ8JTtuXZ/AF9OobsAY/fTBa6kgiTKt1mVggY0aRzrOgofxwkzHJrXD1kji69IkrNT4Zl8PT11i1pEn8Gf0=
X-Gm-Message-State: AOJu0YwKws5ICQI0VoGyJ3qQOHqsI1zzw7kwXg9MY1v5ourvAHsxVFvm
	5T8etQXXhtC68tpYAhdknwJ+ghY4V/vpxmSUTsnxMPYjQ4Xil54yYZLxlrjjxxuwoH7RUX1AhPh
	LrSga4QrPoGEqOTyNBnUVmOQFgIg=
X-Google-Smtp-Source: AGHT+IEDAousrEZ3k6juX9bEYobjR90muGMV5s81+/upBNE7322xB6ctfx2t1AhPz0DRK0RF1UBybn/Avh/wJyco1cQ=
X-Received: by 2002:a05:6902:1b0b:b0:e03:5b8f:89ae with SMTP id
 3f1490d57ef6-e05febe512bmr5381641276.40.1721340362699; Thu, 18 Jul 2024
 15:06:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240711193749.2397471-1-tmaimon77@gmail.com> <20240711193749.2397471-5-tmaimon77@gmail.com>
 <ZpFrslx57m62SEsg@probook> <CAP6Zq1gYSiXFhtA0HAaoSLD7Lz-9nuoy-cUn+qvh0BLev_ifVg@mail.gmail.com>
 <ZpmB5XHvEsiER6Ee@probook>
In-Reply-To: <ZpmB5XHvEsiER6Ee@probook>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Fri, 19 Jul 2024 01:05:51 +0300
Message-ID: <CAP6Zq1hGyM62Gr0ZZ065O8_jTAouK2_U1NY=guY9bqgcuszgRA@mail.gmail.com>
Subject: Re: [PATCH v1 4/7] pinctrl: nuvoton: npcm8xx: remove unused smb4den
 pin, group, function
To: =?UTF-8?B?Si4gTmV1c2Now6RmZXI=?= <j.neuschaefer@gmx.net>
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
Cc: benjaminfair@google.com, linux-gpio@vger.kernel.org, avifishman70@gmail.com, venture@google.com, linus.walleij@linaro.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, joel@jms.id.au, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Done in V2 :-)

On Thu, 18 Jul 2024 at 23:58, J. Neusch=C3=A4fer <j.neuschaefer@gmx.net> wr=
ote:
>
> On Tue, Jul 16, 2024 at 05:24:11PM +0300, Tomer Maimon wrote:
> > Hi,
> >
> > It does not exist, do you suggest modifying the "unused" to "not exist"=
?
>
> Yes, that would be clearer in my opinion.
>
> Best regards,
> Jonathan
