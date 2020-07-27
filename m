Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E17B22FD92
	for <lists+openbmc@lfdr.de>; Tue, 28 Jul 2020 01:28:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFwwl6T29zDqlB
	for <lists+openbmc@lfdr.de>; Tue, 28 Jul 2020 09:28:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::331;
 helo=mail-ot1-x331.google.com; envelope-from=proclivis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=N6pYnfl1; dkim-atps=neutral
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFwv94nCFzDqkW
 for <openbmc@lists.ozlabs.org>; Tue, 28 Jul 2020 09:27:16 +1000 (AEST)
Received: by mail-ot1-x331.google.com with SMTP id a26so4805709otf.1
 for <openbmc@lists.ozlabs.org>; Mon, 27 Jul 2020 16:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=JhIn8b6E4njT+46jXjOas5u0fUVvtjxTrNRXvzFK7m4=;
 b=N6pYnfl14FImSWchfs9ONG9mFttBt2dsI3qFNd/z7nN4tRfowYkne3h7K8+hewx4X3
 2K0YCas7XCmnY8TJdN8sOe4t+H1/Lr5IlV8wFAcJDp88cIa/HbVWlMz0AeuQ+DFS3fyK
 /5wOjCJ6ndnCcFpZw9ejP3iooMOBipVTaHEtF7+doOTCrWGTEWRLrm3WN9HExgxazyoj
 05dLh6TIv6bnqtdWqtXoiwcEf7qFskowO1plpn7kBLMdwcTTgXyyhxa7jkGhBzMYh6oL
 7vGC9BEaR03/z4Ruc5Lpm1AzDoiUXjb8s8ukdbcv6qEUe97VTUoOxEL9Al5L13zuAdPx
 j9wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=JhIn8b6E4njT+46jXjOas5u0fUVvtjxTrNRXvzFK7m4=;
 b=BKkoOFYSvu11RBhzZ+WxI2ZG2Zrt93vsduQMQNh1UBGZN9wiauadE3RiXS79EwPtLk
 gqy+zAR8au01u42v8HMaADJQirSsQo2zwc1v10dz8vxi5MfMWRweBFeTeDZHjcrXWB3e
 UjXuJhpj6R7CrKmQ78IQTMOsXrqNKco8JwYvSUDOZb0ZIwQ6oDHRhgnOEfINOEUai3C/
 y7PQa/Or8JeHRZj+XEPDgO712LOBqLsyIR6Al56nehfOdWNMWT1lf+eBCvViXVaWoAfD
 0JZJMwaGOD+UKvJmEYrPb8lysA1DbLz4uJq+Fhx194kst2Q58Afb4Gpk3DzuQQom+dS6
 WAeA==
X-Gm-Message-State: AOAM531w6y2joGce6G1ebwEDaKMqhsS5+8Rxh7JO1XhdyVspQOLzVJox
 VOexviVa5ihf5VYROLZ7swOc2j9O5i8=
X-Google-Smtp-Source: ABdhPJz152tD09/a6oLAMPF3NvDayoyyd5LDlwaa1z5xSPhFogiWZo8595k6RJhcAX48zMp87Lybfg==
X-Received: by 2002:a9d:d57:: with SMTP id 81mr21729336oti.184.1595892433455; 
 Mon, 27 Jul 2020 16:27:13 -0700 (PDT)
Received: from ?IPv6:2601:281:c001:2359:cc50:b41f:e560:cea8?
 ([2601:281:c001:2359:cc50:b41f:e560:cea8])
 by smtp.gmail.com with ESMTPSA id s141sm885381oos.11.2020.07.27.16.27.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jul 2020 16:27:12 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Mike <proclivis@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: Infinite redirect.
Date: Mon, 27 Jul 2020 17:27:12 -0600
Message-Id: <BEDEB8D3-6C53-41B5-B5EF-A6D92D22A573@gmail.com>
References: <CACWQX835RVA3deOOzk++XJ+QX3riuN7VpjyZFeNsd010t220Ug@mail.gmail.com>
In-Reply-To: <CACWQX835RVA3deOOzk++XJ+QX3riuN7VpjyZFeNsd010t220Ug@mail.gmail.com>
To: Ed Tanous <ed@tanous.net>
X-Mailer: iPhone Mail (17F80)
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

Ed,

The repo is only config, but some of it could be moved into existing layers.=
 Being new here, I=E2=80=99ll let someone with experience review it and guid=
e me.

I still have yocto vertigo! All the loose coupling is crazy as bad as Verilo=
g UVM test benches.

I=E2=80=99m longing for a good Haskel project where I feel more grounded =F0=
=9F=98=80

Port 22 is a general linux login. 2200 should be a management console. It ma=
y require adding a new user. Running the console from a normal shell fails t=
o. So I believe it is all an authentication or user setup issue.

Mike=20

Sent from my iPhone

> On Jul 27, 2020, at 5:11 PM, Ed Tanous <ed@tanous.net> wrote:
>=20
> =EF=BB=BFI had a reply to your other email in my drafts that I forgot to s=
end.
>=20
> -Ed
>=20
>> On Mon, Jul 27, 2020 at 4:06 PM Mike <proclivis@gmail.com> wrote:
>>=20
>> Ed,
>>=20
>> That fixed it.
>>=20
>> Committed to the repo below.
>>=20
>> Still fails to start the service without /var/log/redfish
>=20
> Make sure you have this revert in your tree:
> https://github.com/openbmc/bmcweb/commit/7f4eb5887f9a52a2832ee9b6e06749575=
903128a
>=20
> If it still doesn't work, there's something that's a bigger problem
> than I thought.
>=20
>>=20
>> Adding -DBMCWEB_ENABLE_REDFISH_DBUS_LOG=3DON will fix it. Otherwise someo=
ne might consider modifying event_service_manager.hpp to create the file whe=
n missing.
>>=20
>> I still can=E2=80=99t l ssh to port 2200, but my goal is to add pmbus sen=
sors and the webui will do for that.
>=20
> I thought by default we were on normal port 22, not 2200.  Maybe you
> have a slightly different config.
>=20
>>=20
>> Anyone that wants to get raspberrypi4 running can use the repo below and i=
t=E2=80=99s Readme. It will get it compiled and the webui up. Mainly is just=
 working config files and a readme with every command I used including makin=
g the image.
>>=20
>=20
> If you are able, consider opening these as patches against
> meta-phosphor to get it building again on mainline.  (note, I haven't
> actually looked at the repo yet, but I suspect there were some recipe
> edits?)
