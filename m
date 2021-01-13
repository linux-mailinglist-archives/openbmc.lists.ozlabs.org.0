Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0182F40F2
	for <lists+openbmc@lfdr.de>; Wed, 13 Jan 2021 02:05:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DFq4W6mWczDqw9
	for <lists+openbmc@lfdr.de>; Wed, 13 Jan 2021 12:05:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d36;
 helo=mail-io1-xd36.google.com; envelope-from=proclivis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ROm6Klmu; dkim-atps=neutral
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DFq3S1nRyzDq5b
 for <openbmc@lists.ozlabs.org>; Wed, 13 Jan 2021 12:04:34 +1100 (AEDT)
Received: by mail-io1-xd36.google.com with SMTP id r9so775111ioo.7
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2021 17:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=VwDmIUY0oYkUSseTbYiQhMfTaJhtQYd2DkbNa0qIEbE=;
 b=ROm6Klmutldmy0XWAN4u/oTrCdGZWXHASjh3PgijZzl16W17xKAiFq+oRcY9EarOx1
 9uLfqKy/AOdGRk7I7hn23wtUdclA6xHiN63LkVpieW5r4O0Tc7qNLZjPicJM/MPvkWTK
 mONbQVgNc/zzaMTvtriaNA9mnMEKYGs4ZDJfdwFKUEKFqXwAq5YhXXw0U0eQUe6uIZfT
 +M22itCd2EzV1Y2y4FQCo2ViGQWrgtaQF94cjX3aMLGjZdXriD0W0408Q/oKKXTcUmWg
 uMrh6v8Iphfv6J1HZ/sMNR7yXrBd1gGHmBjMXMXwqRwAqiwMNI/dtKGHQKbILQJoEUah
 aHBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=VwDmIUY0oYkUSseTbYiQhMfTaJhtQYd2DkbNa0qIEbE=;
 b=QcPBh8gbXqmsdXN522OjNH6v6Qb0nchrUxwXyde6hZd6AEgv2PgP9F1kzNQIvpSEQE
 1aIhdLlBZCt3fnvAdqdQ+7SqGy0R+3NSSOMq55EH/Y6gA0yeiziZi/FSdLfB7TAo6ZQP
 Tw1raeTZq9kKOZ5NWsojGjmafUgYauqxtcBTwUSdCU2a/9XzjSQ9fGu3E+ZS1+/YefYC
 XRC5xxM5kLzUIrUdpJB/lCHeuG04n+JB/Qx3K5ReQXkNMx9XIZ7oGdZroTE4UAGw0XV5
 80qWRvEsh+FLNUhMvML3F+kGKNtgToBxn0yXI4SNQZE9qNfNgfiGUEAKeJxIQ/XF3SkW
 cZUQ==
X-Gm-Message-State: AOAM530kE+5FXpmXvVIb7W1Eis1cVG3xeLwwrwAJyg0n/Qv+V3LCZ4AP
 04O8ep3aW39yjNt92pmDonnAXBJSSQg=
X-Google-Smtp-Source: ABdhPJxo1XVPoT8p3ZVKrOom+FX0a8kfVeNKnnK66FGmIoGymfxO/C4RY+lKLdnlCdriqUzO5WLCXw==
X-Received: by 2002:a5e:820c:: with SMTP id l12mr1510957iom.50.1610499870383; 
 Tue, 12 Jan 2021 17:04:30 -0800 (PST)
Received: from ?IPv6:2601:281:c001:2359:cdc8:1834:1d0f:8b1e?
 ([2601:281:c001:2359:cdc8:1834:1d0f:8b1e])
 by smtp.gmail.com with ESMTPSA id c26sm322377ioa.12.2021.01.12.17.04.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jan 2021 17:04:29 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Mike Jones <proclivis@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: READ_EIN/READ_EOUT
Date: Tue, 12 Jan 2021 18:04:29 -0700
Message-Id: <4816D916-C446-4174-A457-FBA612D72075@gmail.com>
References: <a93a5dd8-3969-4fdb-b25b-b4d5d7fcdbd9@www.fastmail.com>
In-Reply-To: <a93a5dd8-3969-4fdb-b25b-b4d5d7fcdbd9@www.fastmail.com>
To: Andrew Jeffery <andrew@aj.id.au>
X-Mailer: iPad Mail (18B92)
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

Makes sense.

I=E2=80=99m on the SMBus/PMBus standards committee, so if there are ever que=
stions on the standard, feel free to reach out.

Mike

Sent from my iPad

> On Jan 12, 2021, at 5:48 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
>=20
> =EF=BB=BF
>=20
>> On Wed, 13 Jan 2021, at 10:04, Mike wrote:
>> I did not fine use of the commands there, so unless the command comes=20
>> through an interface outside this code, it is not used.
>>=20
>> But I am curious why sidestepping hwmon? Is thus a replacement or additio=
n?
>=20
> The rough justification is that developing a coherent kernel interface tha=
t=20
> catered to the various features offered by different regulators is hard.
>=20
> I don't like the approach but I don't have the (regulator) experience or t=
ime=20
> to help out with the problem either, so we wound up with a userspace=20
> implementation.
>=20
> Andrew
