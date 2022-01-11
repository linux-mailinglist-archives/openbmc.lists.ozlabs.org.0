Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AD07648A42F
	for <lists+openbmc@lfdr.de>; Tue, 11 Jan 2022 01:08:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXrct4wyhz302S
	for <lists+openbmc@lfdr.de>; Tue, 11 Jan 2022 11:08:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JYSP9CSD;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::132;
 helo=mail-il1-x132.google.com; envelope-from=proclivis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=JYSP9CSD; dkim-atps=neutral
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JXrcW2bv3z2xsr
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jan 2022 11:07:53 +1100 (AEDT)
Received: by mail-il1-x132.google.com with SMTP id f4so4482974ilr.9
 for <openbmc@lists.ozlabs.org>; Mon, 10 Jan 2022 16:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=WfHbxaiSs+CveYHfPn/Wnf7ki/wc6+oEk4wLTauziDQ=;
 b=JYSP9CSDBnhb80MRzObxRH5e5Id+qUrnRZaFpYE5EKuhUZjys8QDXaCrmEuF8RnfQO
 FSBf+KWFTOBdMswX6yLgfp4YttrGTp1W4tTl2tBHTscrkKT3Jj0HXFvOPRwi/aMgWHTj
 dfgQE0lgnG7MPSS3cy966i3V2K6A9Ma9cmw2dkYWV3pDtMzeKSa9CVc7JP6f6bcZfdiw
 a+olSfQqzgtNSm50+6spaeYd2M6Z5fK9wDY/+Ojy1ibKGYdM9vaC/QLhhEjeh49qzN6n
 qobvYRay1ibqe+89RIgSzfahTTUqQUUbV/41b63vea/FjNXU0irudfj8mv84UEAGtFa1
 oMsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=WfHbxaiSs+CveYHfPn/Wnf7ki/wc6+oEk4wLTauziDQ=;
 b=A0Nc/jeLlKdc3lTU0EkarJkdiqes2+PHRhpOR2qVKYg7Y6GVR6ALqHJNTx6iiVM3Ae
 TgqOgnpngwsIeaHg296bc+Ymu2nDq0mW+D0PGBY9Pj0Ac4F8In82ydGwhvtO2367TVXB
 jbHRqi49yTQzI/iNc7usQAiXkAbjWBQ3XwqyAL2OzjQoHmBALCSsUkMdvYXWCUxQoxbG
 Q0WZUQsQ9V+8lnMbQo4NOeM2OxNL1Qk72FZnRap4caXnpo5eY09PfBSL02oVoVc/ToqJ
 N6ot+PQmgL64E3afz5+s/wLZ9mRY1Cw9Cq0IbFoYWPKLt0zNE6YkgWqcLkplYdGH0NIx
 F3LQ==
X-Gm-Message-State: AOAM533dJJIV2XTw/P2kptS0PAS7Ghr1KK/Y15zfaIkbkwjhsvP6yzmi
 PCliMVTVaBy2KIWFqdHVQXvOoGWgMcU=
X-Google-Smtp-Source: ABdhPJwfEVXdNXxxRUnFrJ14+bewZulSK00yXN7mwWYrC+jPs8AxXstLq6sKl6QdxpjjVIvIfSsMxQ==
X-Received: by 2002:a05:6e02:1ba6:: with SMTP id
 n6mr1124645ili.69.1641859669895; 
 Mon, 10 Jan 2022 16:07:49 -0800 (PST)
Received: from smtpclient.apple ([2601:281:c000:e8c:8cde:3cdd:9494:1cb9])
 by smtp.gmail.com with ESMTPSA id q11sm4938940ilu.57.2022.01.10.16.07.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 16:07:49 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Mike <proclivis@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: Query Sensor
Date: Mon, 10 Jan 2022 17:07:48 -0700
Message-Id: <87BD375B-77CA-48BB-98D5-67C5ED2E62E4@gmail.com>
References: <CAH2-KxBAxA5SBSw=8NSNKz-_V8=H9qqCLh3ap_f7FEuaa5yx4g@mail.gmail.com>
In-Reply-To: <CAH2-KxBAxA5SBSw=8NSNKz-_V8=H9qqCLh3ap_f7FEuaa5yx4g@mail.gmail.com>
To: Ed Tanous <edtanous@google.com>
X-Mailer: iPhone Mail (19C56)
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

Ok, now I feel dumb. I assumed it was obmc/redfish, not generic.

Thanks,

Mike

Sent from my iPhone

> On Jan 10, 2022, at 4:50 PM, Ed Tanous <edtanous@google.com> wrote:
>=20
> =EF=BB=BFOn Mon, Jan 10, 2022 at 3:47 PM Mike Jones <proclivis@gmail.com> w=
rote:
>>=20
>> Hi,
>>=20
>> I could not find an example of a sensor query in the docs. I assume somet=
hing like this:
>>=20
>> dbus-send --system --print-reply \
>>=20
>> --dest=3Dxyz.openbmc_project.Hwmon-5a446562b1a2e55ef11da905907088a187a66b=
71eb7a1f29187594c05bb8fd9a.Hwmon1 \
>>=20
>> /xyz/openbmc_project/sensors/temperature/lm75temp
>>=20
>> xyz.openbmc_project.Sensor.Property.Get xyz.openbmc_project.Sensor.Value \=

>>=20
>> double:
>>=20
>=20
> I don't have an example offhand, but the interface you're looking for
> in the bolded area is
> org.freedesktop.DBus.Properties.Get
>=20
> Stack overflow for essentially the same question with an example:
> https://stackoverflow.com/questions/48648952/set-get-property-using-dbus-s=
end
>=20
>>=20
>> With the bold interface replaced with something correct.
>>=20
>> Can some one give me an example, and a url about how to query properties?=

>>=20
>> Mike
>>=20
>> Sent from my iPad
