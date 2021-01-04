Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8D92E8F2E
	for <lists+openbmc@lfdr.de>; Mon,  4 Jan 2021 02:28:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D8J0d4PLtzDqYB
	for <lists+openbmc@lfdr.de>; Mon,  4 Jan 2021 12:28:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32a;
 helo=mail-ot1-x32a.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=KWb04tid; dkim-atps=neutral
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D8Hzh1f8QzDqXr
 for <openbmc@lists.ozlabs.org>; Mon,  4 Jan 2021 12:27:11 +1100 (AEDT)
Received: by mail-ot1-x32a.google.com with SMTP id j20so24703137otq.5
 for <openbmc@lists.ozlabs.org>; Sun, 03 Jan 2021 17:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=2aAu8aP/Kfnt2UbuyWlrbxyEqeRKJUaUZW3Ptvla5Vg=;
 b=KWb04tidzLvPRhGIN6jO0SkA1JBGSOXCsGM+H3SxlV2F3h0gWaNXv021KAM/NeIzjJ
 qcg+UvJeBt4Sdh1mWRnWsqRHXAxdg2AS4uxrq0LGounaVSt08TjnkdELiy2wEpx9ZwmO
 vJZVDB2n+QUjMNDtdgL+l/C44wJ52/5UlvIQJ4qb+VPHoradTYYOaIaqgjy/jCyu8Mdm
 MIVQXqAZyxt2v5izAQJtmcZ986tOALWeem5DaRQWZ0CoGtIhJyEd7LVeK7hHC448OX3P
 lKYegDqa/TReSlm3UUbLPTfCmuvR+66+Wh2t0mr1z6l07DhvZSYi2N9m59zFQ/P+UMit
 Q6LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=2aAu8aP/Kfnt2UbuyWlrbxyEqeRKJUaUZW3Ptvla5Vg=;
 b=lEPIyUhak1uNwJpOEcb1E0L2ZMYeLBq5BYtPIEaQpTONUNZY8y/iMXt6y7dZVdld3n
 n0Z9bLzIOFInZlSZ+YoKwT8WtpM6zU7sXDsFsCZZDvPGRolhqtKQgXqPm38JMk08irso
 yvg8Yw/U8f9kxDSbBmEnChXAWQ9068+OwNewnYY/nYe4p9WCeUQOZ2Kh+BvTd/6lhT+y
 mC1S46qXEzcb56d//fbMyA2L/JU173gg/Cf7M6w2icUyIN52TgvF+LdJo+CJhnDi7Ada
 LJ5fI+rm9QB50yiiMLjUXLFnivjmamTNnRwYdcOzCtNnfrT7CHbzfrJjeX3QQLPMJxAq
 t27Q==
X-Gm-Message-State: AOAM531V1z7dTjEbPm+zxumlvL2wlZKJSvD/EYm8YCUtl0BjjlsMvqfB
 aY8aV+JeFCxSdip6rCnqowY=
X-Google-Smtp-Source: ABdhPJys41j4+QaoARZ0RzN2Ht43hwoF8MIUCIeyyPefx8Odau2uuo0Tpcmu1AjchoXualQxxhJVDA==
X-Received: by 2002:a05:6830:22d3:: with SMTP id
 q19mr49088287otc.115.1609723628725; 
 Sun, 03 Jan 2021 17:27:08 -0800 (PST)
Received: from andrews-mbp-2.attlocal.net
 ([2600:1700:19e0:3310:311a:9a2d:f156:c779])
 by smtp.gmail.com with ESMTPSA id k3sm12872644oor.19.2021.01.03.17.27.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 03 Jan 2021 17:27:07 -0800 (PST)
From: Andrew Geissler <geissonator@gmail.com>
Message-Id: <4C410766-951F-4543-AE09-BC3F31197F5E@gmail.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_81A7E12E-F815-44B7-856B-BEC1014BED4B"
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: CI build for yosemitev2
Date: Sun, 3 Jan 2021 19:27:06 -0600
In-Reply-To: <PU1PR04MB224835088E75178D9AB64B85A7C00@PU1PR04MB2248.apcprd04.prod.outlook.com>
To: "Velumani T-ERS,HCLTech" <velumanit@hcl.com>
References: <PU1PR04MB224835088E75178D9AB64B85A7C00@PU1PR04MB2248.apcprd04.prod.outlook.com>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "bradleyb@fuzziesquirrel.com" <bradleyb@fuzziesquirrel.com>,
 Patrick Williams <patrickw3@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_81A7E12E-F815-44B7-856B-BEC1014BED4B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On Dec 21, 2020, at 9:32 AM, Velumani T-ERS,HCLTech =
<velumanit@hcl.com> wrote:
>=20
> Classification: Public
>=20
> Hi Andrew Geissler,
>=20
> We have ported many features of openbmc to facebook/yosemitev2 machine =
and the build is verified from the openbmc/master working fine. Could =
you please help us to add the Yosemitev2 machine in the CI build =
verification. This will help us to ensure there are no build break =
during new patch push.

Hi Velumani, glad to see a new system added to openbmc!

Getting a new system into CI doesn=E2=80=99t have the most defined =
process but
I think in general it has to fall under one of these due to our =
constraints
in compute power for CI[1]:

1) Propose an existing system in CI to replace (and the benefits of =
that)
2) Donate a jenkins compute node to openbmc CI
3) Convince the community that your system provides additional meta-*
    layer coverage (or some other critical benefit) that would be worth
    the additional hit to the existing CI infrastructure.

You could also look into hosting your own jenkins which builds
and scores the gerrit reviews. See this wiki for more info:
=
https://github.com/openbmc/openbmc/wiki/Adding-a-System-to-Hardware-Contin=
uous-Integration =
<https://github.com/openbmc/openbmc/wiki/Adding-a-System-to-Hardware-Conti=
nuous-Integration>=20

[1]: =
https://github.com/openbmc/openbmc/wiki/OpenBMC-Infrastructure-Workgroup#c=
urrent-infrastructure =
<https://github.com/openbmc/openbmc/wiki/OpenBMC-Infrastructure-Workgroup#=
current-infrastructure>=20

Andrew

>=20
> Regards,
> Velu


--Apple-Mail=_81A7E12E-F815-44B7-856B-BEC1014BED4B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Dec 21, 2020, at 9:32 AM, Velumani T-ERS,HCLTech &lt;<a =
href=3D"mailto:velumanit@hcl.com" class=3D"">velumanit@hcl.com</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><div =
class=3D"">Classification: Public<br class=3D""><br class=3D"">Hi Andrew =
Geissler,<br class=3D""><br class=3D"">We have ported many features of =
openbmc to facebook/yosemitev2 machine and the build is verified from =
the openbmc/master working fine. Could you please help us to add the =
Yosemitev2 machine in the CI build verification. This will help us to =
ensure there are no build break during new patch push.<br =
class=3D""></div></div></blockquote><div><br class=3D""></div><div>Hi =
Velumani, glad to see a new system added to openbmc!</div><div><br =
class=3D""></div><div>Getting a new system into CI doesn=E2=80=99t have =
the most defined process but</div><div>I think in general it has to fall =
under one of these due to our constraints</div><div>in compute power for =
CI[1]:</div><div><br class=3D""></div><div>1) Propose an existing system =
in CI to replace (and the benefits of that)</div><div>2) Donate a =
jenkins compute node to openbmc CI</div><div>3) Convince the community =
that your system provides additional meta-*</div><div>&nbsp; &nbsp; =
layer coverage (or some other critical benefit) that would be =
worth</div><div>&nbsp; &nbsp; the additional hit to the existing CI =
infrastructure.</div><div><br class=3D""></div><div>You could also look =
into hosting your own jenkins which builds</div><div>and scores the =
gerrit reviews. See this wiki for more info:</div><div><a =
href=3D"https://github.com/openbmc/openbmc/wiki/Adding-a-System-to-Hardwar=
e-Continuous-Integration" =
class=3D"">https://github.com/openbmc/openbmc/wiki/Adding-a-System-to-Hard=
ware-Continuous-Integration</a>&nbsp;</div><div><br =
class=3D""></div><div>[1]:&nbsp;<a =
href=3D"https://github.com/openbmc/openbmc/wiki/OpenBMC-Infrastructure-Wor=
kgroup#current-infrastructure" =
class=3D"">https://github.com/openbmc/openbmc/wiki/OpenBMC-Infrastructure-=
Workgroup#current-infrastructure</a>&nbsp;</div><div><br =
class=3D""></div><div>Andrew</div><br class=3D""><blockquote type=3D"cite"=
 class=3D""><div class=3D""><div class=3D""><br class=3D"">Regards,<br =
class=3D"">Velu<br class=3D""></div></div></blockquote></div><br =
class=3D""></body></html>=

--Apple-Mail=_81A7E12E-F815-44B7-856B-BEC1014BED4B--
