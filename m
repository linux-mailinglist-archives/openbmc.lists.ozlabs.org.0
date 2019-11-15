Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 686C0FD30F
	for <lists+openbmc@lfdr.de>; Fri, 15 Nov 2019 03:52:26 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47DjYz3tV2zF5yy
	for <lists+openbmc@lfdr.de>; Fri, 15 Nov 2019 13:52:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::131;
 helo=mail-il1-x131.google.com; envelope-from=mine260309@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="r03HKPbm"; 
 dkim-atps=neutral
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DjYD1cKJzF4k8
 for <openbmc@lists.ozlabs.org>; Fri, 15 Nov 2019 13:51:41 +1100 (AEDT)
Received: by mail-il1-x131.google.com with SMTP id z12so7826082ilp.2
 for <openbmc@lists.ozlabs.org>; Thu, 14 Nov 2019 18:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=D9UsAgRUOQkcLQXDPzCyaJtbk/9yI9j6xrghfVkV0Rc=;
 b=r03HKPbmiRCZ6qOCfRNSGmJJLcCwyc43dvt0pwl9SvCVf9d/n6vufbucXJArnnhQwA
 H8CrKBZFzVV6XGIlWSnODNb6P40WroVXJ5gE6rVmCElj/U/Uo2VhGlvdmUvvASOWOGDq
 kUwE/Hycx96xbaFDD/inGQ0jzdH4HBuORsV/+cSD81N6dO6AiaxV2Lx4/YVO6lzRQuNA
 SJlnCiiDFXZcLXhh+B9RAO+80l42Xgvpb/KCwhyPk7KnpoV4tgLhRo8KrIEj+KEfS8a1
 VsM8suuSr7oXNszEU37R+ya7kYDLQeSRUvK8SlyrerXbv115vko2HSJ1bkEX84L15nvb
 iCUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=D9UsAgRUOQkcLQXDPzCyaJtbk/9yI9j6xrghfVkV0Rc=;
 b=iFwW4DlZvIZDSY/3eo5SIusKDXbXZo+bIY/6+T44qlA228DFMWs0FBCmeFPnkyoKWk
 u+nt/che2ahOd5LTMbVSdsvKgh9RPFS03hC3D+Dr4QVy66jmbGAw8F+3Y5vvcTPcLyt6
 sOvH/IMtN0GUPKoKqxy05SXXDsQM+fdlBg8LCXXORB5KQTs92gdNPNdbX1LwBPV9mcvq
 iplQXcHGDBv7a3UZxRL3gkTPaiP+lKmLuQbnQiSjejgkL0ZaeYY2McBs9QEfxSiDt2jB
 zI8v7L0M+kbZqTXMWdAOxvs8LW4iKKf6QdDCNJ7o8J4vKHse42Bvk8j8nmiWKmWOgDCd
 AOWw==
X-Gm-Message-State: APjAAAXztV1+JuY6KNtl0wemCESehFIby07g6ThIiE1SVOE0JH1EMfV/
 02uv3IDQknEzW0VYQGnrZCiv+lFGD12ediSwbMc=
X-Google-Smtp-Source: APXvYqx8ax70u40ND6AqE8WU+V93WhD+S0D1s+2rY4I3PJAFvXlMKr49gT8YHbFat3xmgN2A/vuLwdARf2twpuvshoo=
X-Received: by 2002:a92:af19:: with SMTP id n25mr14471723ili.138.1573786298804; 
 Thu, 14 Nov 2019 18:51:38 -0800 (PST)
MIME-Version: 1.0
References: <HK0PR02MB33487C8E6D56DD2143034D0C9F700@HK0PR02MB3348.apcprd02.prod.outlook.com>
In-Reply-To: <HK0PR02MB33487C8E6D56DD2143034D0C9F700@HK0PR02MB3348.apcprd02.prod.outlook.com>
From: Lei YU <mine260309@gmail.com>
Date: Fri, 15 Nov 2019 10:51:29 +0800
Message-ID: <CAARXrtnjxJw4S25CoBACzY8A8hQtV+8excmoM2iNR5sLqhxcXg@mail.gmail.com>
Subject: Re: phosphor-bmc-code-memt: Support redfish remote firmware update
 with static layout image
To: "Bright Cheng/WYHQ/Wiwynn" <Bright_Cheng@wiwynn.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 Adriana Kobylak <anoo@us.ibm.com>, Neeraj Ladkani <neladk@microsoft.com>,
 Delphine Chiu/WYHQ/Wiwynn <DELPHINE_CHIU@wiwynn.com>,
 Jayanth Othayoth <ojayanth@in.ibm.com>,
 Gunnar Mills <gmills@linux.vnet.ibm.com>,
 Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Nov 15, 2019 at 10:24 AM Bright Cheng/WYHQ/Wiwynn
<Bright_Cheng@wiwynn.com> wrote:
>
> Hi Adriana,
>
>
>
> We add some modifications for phosphor-bmc-code-mgmt can support remote B=
MC update for static layout.
>
>
>
> Do you agree these modifications?
>
>
>
> phosphor-bmc-code-memt doesn=E2=80=99t support static-layout remote updat=
e since static layout fw package could only has =E2=80=9Cimage-bmc=E2=80=9D=
 in the package.

For now, it does support static layout, you just need to upload the
tarball contains separated images, instead of the whole "image-bmc"
tarball.

>
>
> Following are the modifications
>
> 1. Add a name list for static layout only has image-bmc in the fw package=
 and modify related image file checking.
>
> 2. Add checking ApplyTime property for static layout to decide whether re=
boot to apply update process or not.
>
>
>
> Please find the patch for these modifications in the attachment.

It may be useful to support the whole image as well, so please submit
the code to gerrit, and we could review the code.
Please follow https://github.com/openbmc/docs/blob/master/CONTRIBUTING.md#s=
ubmitting-changes-via-gerrit-server-to-openbmc
for how to submit changes to gerrit.
Thanks!
