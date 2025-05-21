Return-Path: <openbmc+bounces-59-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FDFABF4CE
	for <lists+openbmc@lfdr.de>; Wed, 21 May 2025 14:53:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b2WYY5pRfz3bxM;
	Wed, 21 May 2025 22:53:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::e30"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747831985;
	cv=none; b=FEfdjA2ZUYJiegDUkfgGN/8EUbGUnEXkd8O/ap84vxqkZvYS6k9e02DCPqviCnqPxfSaOR48IW1tztnjNOhdvDNQ1feYy7/FDbdPBz+nre7/m0HK8fbNA8HkTVXJK8h15zNHe8oFq3TQflDxZ4q6WFxuYNfeaCdkXq3EQRs1jvKxeoKu170EG43RpgL2Wm4dOaf7xBl1LxBzkpbcHDtWsxHmdJfNkxpkCgQOMQtYUsGQBRB9toJ2sRqKYBwIUeEBsOnUXbBsUa+Ej6aflAel99A115lx9RBus9blpDyYf+roC0vRAGjQWuNCQHp82hSzZsc42Ymu3+LStoXinKqeNg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747831985; c=relaxed/relaxed;
	bh=ly3UfN1XTRUnjdaZ8O/gd0q5IhVh0W/6r4rR6dzb7yk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=emZYRBKsajjXwEbbUqsiEK78xgOMvs8GNRmpvaqEuHlFYTbbO75vkAZ21LnmU7vtQ8HzDaf03/MAJQV4erRWVi4f2sjxcBTnlIBR5KRccVq6M3N68dX94vN1xJEbW5mGqn6cDp44dlVgUbGYy62BFhdxad1kiMsA019NSamzm8PEWt3q5fscfSjSNMmXa4/Ba+Qi2eLbFu6QGTKbd4NvCQqILvJn5X2eWbIgqWSBS587f5AZz0n1lX/4Ev7ZbLz9324mjIMEoPyAHgdxxV9mHcjPzxotxbGOU3WgomIadUPF8Flt2sKyWnguDSq87mY12RmQolIpSO5xGkozzjWG5w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IKjMdR2T; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::e30; helo=mail-vs1-xe30.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IKjMdR2T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e30; helo=mail-vs1-xe30.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b2WYX1vkBz3btJ
	for <openbmc@lists.ozlabs.org>; Wed, 21 May 2025 22:53:03 +1000 (AEST)
Received: by mail-vs1-xe30.google.com with SMTP id ada2fe7eead31-4e290e420eeso1085674137.0
        for <openbmc@lists.ozlabs.org>; Wed, 21 May 2025 05:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747831980; x=1748436780; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ly3UfN1XTRUnjdaZ8O/gd0q5IhVh0W/6r4rR6dzb7yk=;
        b=IKjMdR2ThxiyO8xDk32XfeSC6fOlcn14F0ZzdIDaO9PChEoCFvN7uRyqtyCn2DeaFn
         16MyDhZk3T7J1mA+x1tfNMrTVMiyg+LrvmRfbfXCq75IVDF+6NL/A0+OnrTKxYSSjM+r
         vyRCOOeLZws06KpwEKHEtyzDwlpkrELj7sGbM6qGUoyuSPVuJyxE2CkFTZVxGflHFrVq
         8u8KxyF858T8OuLQyvHDPQpVg76bfRZ4fMW3NveEu9b7+MViczxo3RAKabx9m3amm4lK
         z1jR4gVYYXPClaHyg6aXHwwsYlbbnngcFTDPNtQx1w/hY1h8uzVIklZZwEuVFVqgo4Bg
         /FdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747831980; x=1748436780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ly3UfN1XTRUnjdaZ8O/gd0q5IhVh0W/6r4rR6dzb7yk=;
        b=caYZdyzhp+iipW1ObOMGMHeBlsZeUuEphV7St8pINuNo34AOoT8foerXq7WoIUB6N6
         SAOjlun5PkuAjKjUUfVopUW178Pi/Is3qk4c2FJTaIvEvTDmUj4D38AOJ2eqGjYReAKz
         BaZiORPhlDfPycLbHLHEOUQdZySgl5vO00KxxRjKwEvykFTvMacnqSqcMVuVbmEekpdW
         6rmGreIUP63r1XCxtpFQlC9YW1B4LJpxHY6yrvJDSOXpHwvm20VBBUq+umFsgyU4VMBy
         7Ky003XH5+zXcJkjXnhvVmzUC2JKo6kY9FTpbIi+HX9RCr3NI+ENfS31wph6StNVtrP5
         +RLA==
X-Gm-Message-State: AOJu0YxZv65vHUXRCNxzAwMChTwT+5UC3IYIErzsuvBZ55G4BCahtq7I
	7NybWrGkszkxXxO73bqqhWrJVO60DaYm2OKqFun7AmicghvnHwN+tB1kp0XfJbSMTutOR7hZEpR
	Xt2Z4eTEBBkIgSv30VjCWJRYTsNRoYBqQxIQS
X-Gm-Gg: ASbGnctzqd21dYOh5X9c4cbIpl5p1al9v6QYMWZ2zCItnnFpZzTyF5f9lIkrpNT4tRr
	eQytgtdD8ts1jaa0MdhdVGBMDZsnxEDOqI+0gOpTY4zdt1CjywisDpqdEPjWH6n2lkS8VJ23Dv2
	48A2k3OvA+qyR+Pg57INK8dv3KvbxWNfDbyw==
X-Google-Smtp-Source: AGHT+IFWlmivJ59jSBJlYuVjDhU9BU5gvv9mA8ubt2K5u+x+eiUPFLFCvQSA8MfIk+uGe7TZ7xTVt2o/XAY5ltt8cyc=
X-Received: by 2002:a05:6102:b15:b0:4b2:c391:7d16 with SMTP id
 ada2fe7eead31-4dfa6b5ff89mr19432509137.7.1747831980173; Wed, 21 May 2025
 05:53:00 -0700 (PDT)
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
References: <PH7PR84MB2245E09020AFD1F1581F94FCF09FA@PH7PR84MB2245.NAMPRD84.PROD.OUTLOOK.COM>
In-Reply-To: <PH7PR84MB2245E09020AFD1F1581F94FCF09FA@PH7PR84MB2245.NAMPRD84.PROD.OUTLOOK.COM>
From: Andrew Geissler <geissonator@gmail.com>
Date: Wed, 21 May 2025 07:52:37 -0500
X-Gm-Features: AX0GCFuwP6Bw56Qskzm3_kvuoNg7TqrxnJtnRBT91VE_ckmYgT4CPpMedBgLpic
Message-ID: <CALLMt=rG6eTtfQUTzNsacn_4xUzqO8KYAFh6YCg1XJioJ2tH4Q@mail.gmail.com>
Subject: Re: Update to HPE CLA for OpenBMC
To: "Fischer, Matt" <matthew.fischer@hpe.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Das-Caro, Aparna" <aparna_das-caro@hpe.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, May 20, 2025 at 6:36=E2=80=AFPM Fischer, Matt <matthew.fischer@hpe.=
com> wrote:
>
> I am attaching an update to the OpenBMC CLA for HPE which makes the follo=
wing changes:

Thanks for keeping your CLA up to date. I've updated the HPE CLA
folder with this updated doc.

Andrew

>
>

