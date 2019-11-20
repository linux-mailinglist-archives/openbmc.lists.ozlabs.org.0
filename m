Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A446C10307A
	for <lists+openbmc@lfdr.de>; Wed, 20 Nov 2019 01:01:57 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47HjXy6cNfzDqX3
	for <lists+openbmc@lfdr.de>; Wed, 20 Nov 2019 11:01:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d2e;
 helo=mail-io1-xd2e.google.com; envelope-from=kunyi@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="cRBripbj"; 
 dkim-atps=neutral
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HjXD1HZxzDqSJ
 for <openbmc@lists.ozlabs.org>; Wed, 20 Nov 2019 11:01:15 +1100 (AEDT)
Received: by mail-io1-xd2e.google.com with SMTP id i13so25550486ioj.5
 for <openbmc@lists.ozlabs.org>; Tue, 19 Nov 2019 16:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MKeRjQAD5PgbSePw/ZXTowGWXlPPV9BMKKB8j6Uln6o=;
 b=cRBripbj/nnezn98oq2eWo6bf4ph20TCsmU3msPB7ZjT0GZvkTCOoZ1EhCEjVGSZDB
 9ixbLNucZrAKFg2VP5OVc58ziMtgk7gGqpL02jObQTXTABmjbcqiHS9uKF0Y/Rd4RfaM
 fMMKwlgGkq+8sG4TPxoEtIvH2TFqaVrJxdxdtJkhPku+ZToQNWB71HQnHpkjX00CMsKI
 jQ8u9Y8IsZmr5X3/MZ77VuoBaNVV6FtOtfCGO5VEIpcHaEQ5re5+TXQi/6hxhafY9ME2
 HqRkTJQFy2/g9lnBoWDwnxsGI2DZuAt7lLjasJG2yfvyQlxNdrO2kppDQc2XlbJ1a3At
 vcrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MKeRjQAD5PgbSePw/ZXTowGWXlPPV9BMKKB8j6Uln6o=;
 b=jHcQraWXPtRADv6z71cmdQkl9CXw2yzyl+69PauHTLYUQ4tTrVTrwlkWd5IJTORTS2
 ubTyFCLpU+gjzGFRaUPLYLXJJyW5DG0YVZXzzulhvWk1OmenhVbMFg0RuTCFwsZn0UDK
 H5R9WWGiJedW5mfhxTklbCX6/rhM2XNWFrVK0jZP55DZ5ASVHorVfk8tAPwZCzxmqSAT
 DF5+w48GwxEfqSw7YAnAbbU4yNeL+YJ7vGfixhgunBNhGB0fJ7cGM3erQKysmzgnXqws
 E/JvICwQ+yuOr22W49d8+GHvSk8E/xQ1j/wenqdnkF0CbaicZ7eamhGqdEs6S/2pPSKE
 FUrA==
X-Gm-Message-State: APjAAAWaUuL5a0Odbb+5vaM/CgqB4SoHGhVBCNKwkC/EfWdYYkExTgBO
 cyme845C9SQm51kCfQqRZIcjFlUXAiDmcaW6TW505nB14Vc=
X-Google-Smtp-Source: APXvYqyFZnVdma7wgKu3zsROjcYiN82kkLWUM5LgeJtab2m7hPbRVvwKB+BxXcSNTrhvQabH/nMcTfKuzbEAm/axdtU=
X-Received: by 2002:a02:c9d2:: with SMTP id c18mr589016jap.108.1574208069986; 
 Tue, 19 Nov 2019 16:01:09 -0800 (PST)
MIME-Version: 1.0
References: <dbc2cc41e76c497cb551d81f8298ef0a@quantatw.com>
In-Reply-To: <dbc2cc41e76c497cb551d81f8298ef0a@quantatw.com>
From: Kun Yi <kunyi@google.com>
Date: Tue, 19 Nov 2019 16:00:43 -0800
Message-ID: <CAGMNF6U8+GyKeMpF8+wBmv8wAX6HUwkcCG4XFjfmyxZEGGtN2Q@mail.gmail.com>
Subject: Re: [phosphor-ipmi-blobs-binarystore] Platform configuration and the
 host-tool questions
To: =?UTF-8?B?R2VvcmdlIEh1bmcgKOa0quW/oOaVrCk=?= <George.Hung@quantatw.com>
Content-Type: multipart/alternative; boundary="000000000000d105060597bbe0c7"
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

--000000000000d105060597bbe0c7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi George,

Sorry for the late reply. The current configuration expected is an array,
so you would need:

[{
  "blobBaseId": "/skm/hss/",
  "sysFilePath": "/sys/class/i2c-dev/i2c-8/device/8-0058/eeprom",
  "offsetBytes": 256,
  "maxSizeBytes": 1024
}]

The documentation on the configuration file format isn't super clear. I
will send a patch to improve it.
Currently there is no host-side tools like phosphor-ipmi-flash.
Hope this helps.

On Wed, Nov 6, 2019 at 4:16 AM George Hung (=E6=B4=AA=E5=BF=A0=E6=95=AC) <G=
eorge.Hung@quantatw.com>
wrote:

> Hi Kun,
>
> I'd like to add a platform configuration file for blob basd id and sysfil=
e
> path, but I always get the return error, "Encountered error when parsing
> config file".
> Is my config file format wrong or something I missed ?
>
> My example config.json:
> {
>   "blobBaseId": "/skm/hss/",
>   "sysFilePath": "/sys/class/i2c-dev/i2c-8/device/8-0058/eeprom",
>   "offsetBytes": 256,
>   "maxSizeBytes": 1024
> }
>
> BTW, is there the utility such as the host-tool of phosphor-ipmi-flash to
> test ?
>
>
> Thanks.
>
> Best Regards
> George Hung
> Research Division - Software Engineer
> Quanta Computer Inc.
> Ext: 16830
> E-Mail : George.Hung@QuantaTW.com
>
>

--=20
Regards,
Kun

--000000000000d105060597bbe0c7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi George,<div><br></div><div>Sorry for the=C2=A0late repl=
y. The current configuration expected=C2=A0is an array, so you would need:<=
/div><div><br></div><div>[{<br>=C2=A0 &quot;blobBaseId&quot;: &quot;/skm/hs=
s/&quot;,<br>=C2=A0 &quot;sysFilePath&quot;: &quot;/sys/class/i2c-dev/i2c-8=
/device/8-0058/eeprom&quot;,<br>=C2=A0 &quot;offsetBytes&quot;: 256,<br>=C2=
=A0 &quot;maxSizeBytes&quot;: 1024<br>}]<br></div><div><br></div><div>The d=
ocumentation on the configuration file format isn&#39;t super clear. I will=
 send a patch to improve it.</div><div>Currently there is no host-side tool=
s like phosphor-ipmi-flash.</div><div>Hope this=C2=A0helps.</div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, No=
v 6, 2019 at 4:16 AM George Hung (=E6=B4=AA=E5=BF=A0=E6=95=AC) &lt;<a href=
=3D"mailto:George.Hung@quantatw.com">George.Hung@quantatw.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Kun,<br>
<br>
I&#39;d like to add a platform configuration file for blob basd id and sysf=
ile path, but I always get the return error, &quot;Encountered error when p=
arsing config file&quot;.<br>
Is my config file format wrong or something I missed ?<br>
<br>
My example config.json:<br>
{<br>
=C2=A0 &quot;blobBaseId&quot;: &quot;/skm/hss/&quot;,<br>
=C2=A0 &quot;sysFilePath&quot;: &quot;/sys/class/i2c-dev/i2c-8/device/8-005=
8/eeprom&quot;,<br>
=C2=A0 &quot;offsetBytes&quot;: 256,<br>
=C2=A0 &quot;maxSizeBytes&quot;: 1024<br>
}<br>
<br>
BTW, is there the utility such as the host-tool of phosphor-ipmi-flash to t=
est ?<br>
<br>
<br>
Thanks.<br>
<br>
Best Regards <br>
George Hung<br>
Research Division - Software Engineer<br>
Quanta Computer Inc.<br>
Ext: 16830<br>
E-Mail : George.Hung@QuantaTW.com<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Regards,<div>Kun</div></div></d=
iv>

--000000000000d105060597bbe0c7--
