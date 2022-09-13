Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 610305B70F4
	for <lists+openbmc@lfdr.de>; Tue, 13 Sep 2022 16:39:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MRmLn1YJ4z3blV
	for <lists+openbmc@lfdr.de>; Wed, 14 Sep 2022 00:39:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JnmmCYrE;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com; envelope-from=icepbix@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JnmmCYrE;
	dkim-atps=neutral
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MRmLL3kdhz2xJ6
	for <openbmc@lists.ozlabs.org>; Wed, 14 Sep 2022 00:38:49 +1000 (AEST)
Received: by mail-wr1-x429.google.com with SMTP id bq9so21161386wrb.4
        for <openbmc@lists.ozlabs.org>; Tue, 13 Sep 2022 07:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date;
        bh=w7EXnyiJntVVsun2JWssD7kGk/0PXVK40bAR3jQElW4=;
        b=JnmmCYrE8CyL3sMbi+RwlbO5dgk8YB0Kjk/Gr55YOyKtUYnfLGlW7jNXUgrRrtmuU7
         2f/ZVx9jhNDxMoHErqHNGImvrNonkZqb6Ky5neUg3nNYiIe6+7wcC4M04FRGEfzG5ghy
         okcc/8e+77bZYvKv44IxDCMjph2BkdVL9mCJ7E98gr0lMgDh9sEMPhmAbU8jYQa7k3pF
         a6NDdxusyOnDfJ83ruuj/T9fwtReFzsyU4OTtKJLNa3sV1RilI3yZA9sv3Ivp1SFXkSm
         A1OsyGCCFQRREEUUXef/WJZjBbqYapJmXrwNFx+gv1VsX8UIZHzFGLrO99yUsiRXCu00
         iCKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=w7EXnyiJntVVsun2JWssD7kGk/0PXVK40bAR3jQElW4=;
        b=y7pXaXSuScn9feBQ+DgmHbKrDIFyiUCt4jfrFBT4MhC0kHjX4i8RYQfjFCBw+pQ2Zn
         rHpgEW5tfvk1oRYdhfvPyHztmO5e3t8jWz9cEzj+QCBYhBYkU5xX/kBJhl3DTSR7qTu1
         NIFwJgNA9vg5WNJL7ibzmsfdw2rK6MC/lnM2qIfapkGOew3EyxygMu1oll3Ov7yVPpYh
         1iMUQ/OPrNeDtSEuOyqAtMGgZJwxExCG9voz1TMqn91zQNgQV6VfzHAoJlEUs1ei3jBm
         HTDfYGfTxCcBcWr0W0tW7sbGcFGZjm+GsSVusD0lod+w0qBdQkv74Z6+XKbfIZR6DZnQ
         vINA==
X-Gm-Message-State: ACgBeo0kA020hHpfZJKzVKvwYiy6E8d/hUf/5n2UBa7m0Ky6F+6Gac4r
	Wm7+pzNaEXGgs9D7o6slV3Ohj5XTEIWYc6bQEXevnrDfA1BNjyUL
X-Google-Smtp-Source: AA6agR6Drca7NhACmPVTnzAlTzP4MlkRr/E3r58gHvAPM4G4EkoL2++GaYAMjQpAKqvYp9C7Rzf9fl/PbwyVjJOweso=
X-Received: by 2002:a5d:6da7:0:b0:226:e081:941a with SMTP id
 u7-20020a5d6da7000000b00226e081941amr18294031wrs.642.1663079923467; Tue, 13
 Sep 2022 07:38:43 -0700 (PDT)
MIME-Version: 1.0
From: Nikita Pavlov <icepbix@gmail.com>
Date: Tue, 13 Sep 2022 17:38:32 +0300
Message-ID: <CAJewAaJM_BJcCUDTb36DPkOXCihCS48TAwk+qxYSD+oySQx8Xw@mail.gmail.com>
Subject: Is there a way to get CPU model from PECI bus
To: jason.m.bills@linux.intel.com, openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000124bae05e88ff8e1"
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

--000000000000124bae05e88ff8e1
Content-Type: text/plain; charset="UTF-8"

Hi Jason,
I use libpeci bus to get some information about CPUs. Now I can read CPU
family and stepping number when I use this function peci_GetCPUID.
Is there a way to get CPU model information though PECI like this 4116
(Intel Xeon Silver 4116) ?

-- 
Best Regards,
Nikita Pavlov
E-mail: icepbix@gmail.com

--000000000000124bae05e88ff8e1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Jason,</div><div>I use libpeci bus to get some inf=
ormation about CPUs. Now I can read CPU family and stepping number when I u=
se this function peci_GetCPUID.</div><div>Is there a way to get CPU model i=
nformation though PECI like this 4116 (Intel Xeon Silver 4116) ?</div><div>=
<br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=
=3D"gmail_signature"><div dir=3D"ltr"><div>Best Regards,</div><div>Nikita P=
avlov</div><div>E-mail:=C2=A0<a href=3D"mailto:icepbix@gmail.com" target=3D=
"_blank">icepbix@gmail.com</a></div></div></div></div>

--000000000000124bae05e88ff8e1--
