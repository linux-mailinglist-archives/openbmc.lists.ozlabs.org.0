Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B26A32917AF
	for <lists+openbmc@lfdr.de>; Sun, 18 Oct 2020 16:00:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CDhNN1K4MzDqdT
	for <lists+openbmc@lfdr.de>; Mon, 19 Oct 2020 01:00:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::735;
 helo=mail-qk1-x735.google.com; envelope-from=tbnguyen1985@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=bPNzkQ/7; dkim-atps=neutral
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CDhMR4v17zDqSR
 for <openbmc@lists.ozlabs.org>; Mon, 19 Oct 2020 00:59:08 +1100 (AEDT)
Received: by mail-qk1-x735.google.com with SMTP id 188so5872384qkk.12
 for <openbmc@lists.ozlabs.org>; Sun, 18 Oct 2020 06:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=SLz2bNktpjLjQ+mfDjhbL3TwK6T9FWPgrLTMomO76zA=;
 b=bPNzkQ/7TCYsslb2elf5qf8E4W2zFsPlihcHdm8npSQKFJ0UQlc9gqa75lXoQfIJwY
 1oCo3ku/KEisMclAbwDpVEyyhH7DXWiEebrCi0ej9Cwu+0G8nQq+BdNA1ttPVUc/pWrh
 KEEwAIKMPn8hA29XcDby7PkuFkuAflO9/gjALrgwkQuD/F1UlQVZnYzDjbpLrcEVMccH
 3vzk/lxF0lQS48+lzdjgNhLVaRVQRymXb3x2bBVx6qxRMmZ+X1RRTrsZuZxNOtqu+IC7
 OnMq2nb8rFo9uB/udOZK59C9nYVu0PcnghMilx5VkJdhp4H7vWu4+87y9R08Cufwpj5Y
 jhVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=SLz2bNktpjLjQ+mfDjhbL3TwK6T9FWPgrLTMomO76zA=;
 b=qaHkiXWLC9ri4QYwp0NsPL2+W8EP4BClTFi0LBMxmMibCFpwilVWHgvvTglNF0mGHa
 MCzez9aplfU+RpyBM3ys6AbXcln82QSNPXFqVcRP6cnFxkPTtigY7f0JSRbg5QlTWzwV
 Hs7zRi1/vJaBn5hWPtSFdBqCl8v00tzx+6kD62+WRiD/3Hvve01cRJ+l0iEKQ5fId464
 Y4VYYZOySKFN7JtqZHh0rFLWuLk1aHyq/3rdbVM4SPztaRzQBqruzxFZxY7yzCEgrgcW
 OaayfZ4Mm5jLVpEd+rNRJEj0axCLl8vglODyAn0r9ZaGGKuuxIC4Nrf1eJoCyYTzFRIb
 D58g==
X-Gm-Message-State: AOAM532lLym+/mh7Z8uwf+aE9oS8Ph0b9M4B9H2kbaSwIBQPYp+Yct0D
 1m64CIwd+v+oLjTiY65wlIFxePEiwcNqkUsngop1OtclcG4=
X-Google-Smtp-Source: ABdhPJwuF3SOBmmjH6f8cF0vVXFtqYt3T+fi8rrhc/kIVIVO5KuhuV2TGZYLXubHMJv/CTDBpX2L91879z81VOPEx14=
X-Received: by 2002:a05:620a:2e3:: with SMTP id
 a3mr11437252qko.117.1603029544183; 
 Sun, 18 Oct 2020 06:59:04 -0700 (PDT)
MIME-Version: 1.0
From: Thu Ba Nguyen <tbnguyen1985@gmail.com>
Date: Sun, 18 Oct 2020 20:58:53 +0700
Message-ID: <CALioo35zJdqL7uAhvxAuqa7c16wAdtfc+JVSz6Tg5UG5Yp8L3w@mail.gmail.com>
Subject: Enable/Disable some sensors when Host On/Off
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000008bac0b05b1f26649"
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000008bac0b05b1f26649
Content-Type: text/plain; charset="UTF-8"

Dear,

I'm supporting the host sensors for Ampere Computing LLC platform.
We are using phosphor-hwmon to update values of sensors and monitoring
sensors warning/errors base on threshold setting.

There are some sensors which are turned off when host Off. It can be the
sensors reported by host or voltage/temperature/power sensors  which use
the same power source with host.

I researched in openBmc sensor-architecture documents but can't find any
option to enable/disable sensors base on one status or GPIO pins. I can't
use REMOVERCS.

Research in phosphor-hwmon code, I don't see the answer too.

Do we have any options/solution to Enable/Disable some sensors when Host
On/Off?

Thanks.
Thu Nguyen.

--0000000000008bac0b05b1f26649
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Dear,<div><br></div><div>I&#39;m supporti=
ng the host sensors for Ampere Computing LLC platform.</div><div>We are usi=
ng phosphor-hwmon to update values of sensors and monitoring sensors warnin=
g/errors base on threshold setting.</div><div><br></div><div>There are some=
 sensors which are turned off when host=C2=A0Off. It can be the sensors rep=
orted by host or voltage/temperature/power sensors =C2=A0which use the same=
 power source with host.</div><div><br></div><div>I researched in openBmc s=
ensor-architecture documents=C2=A0but can&#39;t find any option to enable/d=
isable sensors base on one status or GPIO pins. I can&#39;t use REMOVERCS.<=
/div><div><br></div><div>Research in phosphor-hwmon code, I don&#39;t see t=
he answer too.</div><div><br></div><div>Do we have any options/solution to=
=C2=A0Enable/Disable some sensors when Host On/Off?</div><div><br></div><di=
v>Thanks.</div><div>Thu Nguyen.</div></div></div>

--0000000000008bac0b05b1f26649--
