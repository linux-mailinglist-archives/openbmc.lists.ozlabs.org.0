Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5CA9BC116
	for <lists+openbmc@lfdr.de>; Mon,  4 Nov 2024 23:50:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xj6BD2r1Gz3c1D
	for <lists+openbmc@lfdr.de>; Tue,  5 Nov 2024 09:50:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::234"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730707960;
	cv=none; b=NFCq+Kqpw+oudxSi0nQcPN4J+Dh2lOfuw70qEDd5aV+WsXv8kBwAXwcWOUpxoeBswI6nqZCXjZq47kRRXwvsbwe8i3p5od8GNeC007/JChDXSNI5x8i01gCrvouL06FMM/OabVoV1mdA+16zballEWL/HQzWLO1juGd12o/Mj4tiQ9dgyC2Fz/sBipkt5lUr5LuBkjahG0dWnWRl4ILLmcSxGMp1i4M14l9NNU4SMQXW1F9sBAofV3b3aww+sZcYqfvUZgSMWOhIAIoOX7QmJWE2J/pqo8+nGwbuwKQlS5g2VuvPzTuRRyPegZsjTDYX5dCD/KvIfxEYVF05sek1Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730707960; c=relaxed/relaxed;
	bh=XCX6qrzCMImbBpxh+YBej+RlpN9TLIbz23OhwpXYnmc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DexJFVDEu7tsS0tPJxROHsDiVHSlNWIn4YjbGftyHbQx2TFyZk8p9OxjjujfOHLWC/vwowLiCRJoGTeA/bXUB7ZmcEu//QcnvoHGf2SePKYTNtSwYsQshRr6DPctLdxSW31+Sro5Vo05phm9E80Qt4FsRbnQN/SSV7NkaO/AQoRUHA76p0w1k/ljJwjy276lpsw+gp5mX7NXLMv3IJ2hRRO5jX0Qu+NlGzkrXFIVlLUJfeRlwqjoq9iXOiQSibZQfCh9o/RFCCh7PdMX9CGXmecxI9DQUiCO6fzob+9UZ0/CA2/HbGGp9el6+NeFMvfGTsRILMgnS4/AIoixctGdkA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BPGZwT+Y; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::234; helo=mail-oi1-x234.google.com; envelope-from=baneric926@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BPGZwT+Y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::234; helo=mail-oi1-x234.google.com; envelope-from=baneric926@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XhkjM433Yz2xQ8
	for <openbmc@lists.ozlabs.org>; Mon,  4 Nov 2024 19:12:39 +1100 (AEDT)
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3e60e57a322so2117705b6e.3
        for <openbmc@lists.ozlabs.org>; Mon, 04 Nov 2024 00:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730707950; x=1731312750; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XCX6qrzCMImbBpxh+YBej+RlpN9TLIbz23OhwpXYnmc=;
        b=BPGZwT+Yo536PoOmzDhKxriqNIDHPoufci8iN3yWpceJhvtVpnu3SfLTKaBe61yFQV
         8TdOGJg5Bz3NhsQd+cOQ/QQPELWcKWv6Xl6OqeZsUGkvTrEL3RSHRWQf44FbT91mO/bf
         GcKSG4H80tLF/oXRh6TCghGerakco/ns1UQ/hzJabwu5rJ50yzbDI9dDA1TwWYQUo7w/
         xkP5TLeNgkIGYf4lTKQRkVuaPT+N82BAw3vjvB3QOy8yT7PcZtixKwWYqXTqKry7upGD
         EthTOPljnshXD84Offkw0nJA12WXmoqMgnnsH9QAOTbzr8fmCp3pUpXqZwYsXKs9Kvf+
         E/eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730707950; x=1731312750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XCX6qrzCMImbBpxh+YBej+RlpN9TLIbz23OhwpXYnmc=;
        b=hzhNIUtXzKCfshUgJz6XrasvGUL0IdeeA2VZaGljzeaHFY+vowzwWezbIla98LyNuV
         1fuMBe5LMYqZnZldvFuriiZZD3Hbm5nvczaQHh4pr9sxUn1YoUqnaMxSdV09v++glQGS
         LSxpJ5t0o3vqeerjpdz9IhhckPktOtuMLs1QVzNQ4m/QpGoddvO7FuEGamlrLDtDfScN
         WAu4O4AI5yj0+NAkg17rsB/cwBcF6yGuB5rcmktM+UuZUZRqux11qf8y33rfNy1nDBaL
         zyS71mfe3+h7Gr/U2y5vLQI+l6YD+Kgfk1P0PsqMwpw27yYc/FVSGW+TAcZtk5lLZNUh
         HhFg==
X-Forwarded-Encrypted: i=1; AJvYcCWkoq8gAcbTgZZPg6yGcq0vRwu9XGf09DxtLRL0H7l3ZYurlMVfNqsBazcJricvEPIMXH/2RjnQ@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx1Zd3Ezv4pkxtDpZPDlUJ3LO51mKOP+36omnw3YxqvLD6JGHmh
	2qBVfCwK4ZL6Lz55Z7bKf5/zuJiKWtXUtTPFAlmnybXD0QZ7AWGJ6rYD3PDI/CMzkNu8hlmq+3l
	acpsWaQgfH04KLR6DR0cTX7mCKmA=
X-Google-Smtp-Source: AGHT+IHyNmXIv/Qkf7hr1oDZ5RSdZMwySKzbkHyHElTN8xOk9/nD1kciEaKHao+bZTDKxz2iSJGs2BZ1r4zKnk+g5NA=
X-Received: by 2002:a05:6808:448b:b0:3e6:23b7:bf4c with SMTP id
 5614622812f47-3e63846135emr26460681b6e.13.1730707950027; Mon, 04 Nov 2024
 00:12:30 -0800 (PST)
MIME-Version: 1.0
References: <20241022052905.4062682-1-kcfeng0@nuvoton.com> <20241022052905.4062682-3-kcfeng0@nuvoton.com>
 <319d7395-680b-478a-aec3-08bae9177f73@roeck-us.net>
In-Reply-To: <319d7395-680b-478a-aec3-08bae9177f73@roeck-us.net>
From: Ban Feng <baneric926@gmail.com>
Date: Mon, 4 Nov 2024 16:12:18 +0800
Message-ID: <CALz278a9ypz+2j7yfHQ1t9M_HxJW_8oW6rmYOOgUSKCTxMz+Vg@mail.gmail.com>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, jdelvare@suse.com, corbet@lwn.net, openbmc@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, DELPHINE_CHIU@wiwynn.com, kcfeng0@nuvoton.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, kwliu@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Nov 1, 2024 at 10:48=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On Tue, Oct 22, 2024 at 01:29:05PM +0800, baneric926@gmail.com wrote:
> > From: Ban Feng <kcfeng0@nuvoton.com>
> >
> > The NCT7363Y is a fan controller which provides up to 16
> > independent FAN input monitors. It can report each FAN input count
> > values. The NCT7363Y also provides up to 16 independent PWM
> > outputs. Each PWM can output specific PWM signal by manual mode to
> > control the FAN duty outside.
> >
> > Signed-off-by: Ban Feng <kcfeng0@nuvoton.com>
>
> Applied. I did fix a couple of the nitpicks raised by Christophe,
> but I did not replace for_each_child_of_node() with
> for_each_child_of_node_scoped() since I can not test the code
> and did not want to make a functional change.
>
> Thanks,
> Guenter

Hi Guenter,

Appreciate your kind support,
I'll keep following your version and check the part of
for_each_child_of_node_scoped.

Thanks,
Ban
