Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4432F3C91
	for <lists+openbmc@lfdr.de>; Wed, 13 Jan 2021 00:35:19 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DFn4F2jrtzDqpf
	for <lists+openbmc@lfdr.de>; Wed, 13 Jan 2021 10:35:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22a;
 helo=mail-oi1-x22a.google.com; envelope-from=proclivis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Lu6lN/nN; dkim-atps=neutral
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DFn3Q5HgDzDqnW
 for <openbmc@lists.ozlabs.org>; Wed, 13 Jan 2021 10:34:25 +1100 (AEDT)
Received: by mail-oi1-x22a.google.com with SMTP id d203so225642oia.0
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2021 15:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=2HQKrnYMAey/SeIiWLmE3MePGofhZn8utfUoyX3UJ0U=;
 b=Lu6lN/nNKe5ZZ+/AAZ3j/xPgHqd92HW5Q16qlwjztZRyQJDwJqRGI1GkFb2j3CeTaL
 WRQ3fBfkOAoO0mWvmBqk57RV+6agoxIlfoqe4L7jgh5o2cyRiwRobYWycoNj8LC1Zu5W
 UWXDrQJ4BafJcZSz10IqlRmzCmw4bWVZFZpyRAfRP1252HbuvN/ux4mmVtIVQqPqKxQk
 bgELflmnmcxZqnsHSgeGgBi+d04tCNhnrwmAPhpng73eW9gp3BQByYrn6UDgNfv5uZDs
 xtA04qcf1LWo0vcsbfE67XDh+K+6xxHMbX07eTQzKlO2ee49uSNDCYDM+XS2iIVZAe+R
 nlLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=2HQKrnYMAey/SeIiWLmE3MePGofhZn8utfUoyX3UJ0U=;
 b=bYdfrFJMhxoRA2U0yUFD4IDNfzmgHVE8u7uUV4QDrTXW4tqisa0u6SZc3DnC8g+ud9
 9BKuLIvam+NHID69fY62EWmlq2nDPVr8uWfdoEg/yjwb0pQAHGOPeLvSIXJZLGQxoUSE
 BH7TJHCBDHX266W8K82puyxeIMW7sM0SH5v0xBTU41BY12afQg6gT3L1fwSVPVloA5Ub
 BnSasFOEgFEG11oQ+pHq+/CWR0YlZdEyLz3CKkTFSWcxPH2c1m6/EclKC3kt/7DD3yZj
 1bKibnObCohyR8UiNqfFHHH4YZsy5R3UcI4CqiXNkXkT+qHDUOL6ENFLLJq4xHSXtV5z
 F+xg==
X-Gm-Message-State: AOAM530ifYVJ115z9+j+R9rHPOhZVAvIZLlRpXGkR+5d2IEx8n4vos7I
 WuzhJtEASLK+IheNGZxpj2UP1512QNc=
X-Google-Smtp-Source: ABdhPJykdvi4pl1oHgg/Fl1yVjsMa4xMw6VAjF4bMnJYI730ZzRQozLOJy6FTpglvhEitMuzdC55EQ==
X-Received: by 2002:a05:6808:8c7:: with SMTP id k7mr32479oij.31.1610494461511; 
 Tue, 12 Jan 2021 15:34:21 -0800 (PST)
Received: from ?IPv6:2600:100e:b036:3976:28cf:1a42:1072:4111?
 ([2600:100e:b036:3976:28cf:1a42:1072:4111])
 by smtp.gmail.com with ESMTPSA id j9sm37998ooq.1.2021.01.12.15.34.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jan 2021 15:34:20 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Mike <proclivis@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: READ_EIN/READ_EOUT
Date: Tue, 12 Jan 2021 16:34:19 -0700
Message-Id: <3C0268AE-8BAE-44DB-BE4D-C91FD8968D72@gmail.com>
References: <810c6160-b75f-4b89-b482-28664ac775f0@www.fastmail.com>
In-Reply-To: <810c6160-b75f-4b89-b482-28664ac775f0@www.fastmail.com>
To: Andrew Jeffery <andrew@aj.id.au>
X-Mailer: iPhone Mail (18B92)
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

I did not fine use of the commands there, so unless the command comes throug=
h an interface outside this code, it is not used.

But I am curious why sidestepping hwmon? Is thus a replacement or addition?

Sent from my iPhone

> On Jan 12, 2021, at 3:54 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
>=20
> =EF=BB=BF
>=20
>> On Tue, 12 Jan 2021, at 08:18, Mike Jones wrote:
>> Within the PMBus standard are two commands for energy: READ_EIN, READ_EOU=
T.
>>=20
>> These commands exist on both regulators and hot swap devices.
>>=20
>> - Are these functions getting used?
>> -And if so, to what purpose, examples of where to look in the layers=20
>> for the usage, and any other helpful pointers
>=20
> In theory you should only need to look in the kernel, but we also have a=20=

> userspace project that is implementing a pmbus subsystem in userspace (whi=
ch is=20
> unfortunate):
>=20
> https://github.com/openbmc/phosphor-power
>=20
> Andrew
