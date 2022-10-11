Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB605FAF54
	for <lists+openbmc@lfdr.de>; Tue, 11 Oct 2022 11:28:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mmr7h4WZhz3cBw
	for <lists+openbmc@lfdr.de>; Tue, 11 Oct 2022 20:28:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=O9S3zcFB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com; envelope-from=icepbix@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=O9S3zcFB;
	dkim-atps=neutral
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mmr755M8Cz2xvJ
	for <openbmc@lists.ozlabs.org>; Tue, 11 Oct 2022 20:28:15 +1100 (AEDT)
Received: by mail-wr1-x42f.google.com with SMTP id bp11so7903882wrb.9
        for <openbmc@lists.ozlabs.org>; Tue, 11 Oct 2022 02:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=P+fyWolgdXSGUMViLuvWEPpXt+OSJaCwZisZ2fdw6fk=;
        b=O9S3zcFBWxXr9Gf1KfGxMnAUGjqTGRS2mKaSr8URj8CTWj1aUYrumDfD9YMvKalqW6
         ydEPjKrQwIgufo3kyhOZh+8plZQPsieT5NpAFNDEagPVUTID61moF2NBlx0LbU6tpNX0
         mxl/bdsOz8YJMg5xKn+vu2Zpr9ul23WXy1x/Zpp73e7xriWLtUAWmnTVg83EUjjHJBjz
         fC5+6jPMACvyQuNbrZA9sBor4ce5dB9Sz+APPknwxde8hXcdmdygWWNOREVAfO9S6yf6
         PeCtBll2ZnAXL4ZoIxBKSotqZh1eQkLHz6r4OuMxS9Ch4wyq3oKXd8wqjC0G3nbekt6Q
         YQ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P+fyWolgdXSGUMViLuvWEPpXt+OSJaCwZisZ2fdw6fk=;
        b=OQ1mh2HHSQLRubomIkjaxcJu5MUPCVHTyLZsunwXHOJ4M6DZ4t6oxqX1dkF4+KTFR3
         6KuyP1VUcC1GN7we0sph0A14MA3N+qs8zwVxlp/PDYn/KpehGJeNYkRzSeB1EQraNA+T
         5umIsAWBEGDm2wGK/MhFVW+0Njrl0Mby4Xb501gW5sAnZFAPmEs5Yp6U+6tSIgz3pJiC
         aGdAVc/9GdL3jHwuT6eYUQwL29pLVvVUK/Nn48zwjWFrtXa7k38bJrRHhcb/RvfI2wYj
         +pVdjKWs5DY9x1IbRM6ARCoD5vZTpWUHdNygl5sk0B1CGaRJ5DVCDaKYBijgru2REewG
         tgSA==
X-Gm-Message-State: ACrzQf0Yn1Xq8caBn4w/MPFtfqAotSYTROLzdbtIzX11BmJb4rQo87Bj
	x7ow/LmY6X0Br5Y5D5Jx2UTM9lJKQCUTPaAcikcSa6fCrno=
X-Google-Smtp-Source: AMsMyM52beucIwUPide9UJnon4Z1rVvPR6BdMAiggNf8ZFsu2JsYpIlYHTpp66cUiajifRrRaK0P+8QJvJ5BQzYkAe0=
X-Received: by 2002:a05:6000:1786:b0:22e:3955:13a1 with SMTP id
 e6-20020a056000178600b0022e395513a1mr14291070wrg.624.1665480489674; Tue, 11
 Oct 2022 02:28:09 -0700 (PDT)
MIME-Version: 1.0
From: Nikita Pavlov <icepbix@gmail.com>
Date: Tue, 11 Oct 2022 12:27:58 +0300
Message-ID: <CAJewAaLk0Q9fnmT_s_8TdnDfcJMXbLcS4=OZoeT5+qatDnGFKQ@mail.gmail.com>
Subject: how get smbios blob with intel-ipmi-oem
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000f7ac4b05eabee4bd"
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

--000000000000f7ac4b05eabee4bd
Content-Type: text/plain; charset="UTF-8"

Hi All,

Now I work with intel-ipmi-oem and want to get smbios blob.
I use intel-ipmi-oem lib and ipmi-whitelist.conf with phosphor-host-ipmid.

I test this by ipmitool like this ipmitool raw 0x30 0x1a and get:
Unable to send RAW command (channel=0x0 netfn=0x30 lun=0x0 cmd=0x1a
rsp=0xc1): Invalid command
 In journalctl:
Oct 11 09:06:43 QV-00002-3a1b4b0da2c0 ipmid[278]: Channel/NetFn/Cmd not
whitelisted

How I can debug  this ?

Are there any examples how to get blob with intel-ipmi-oem ?

-- 
Best Regards,
Nikita Pavlov
E-mail: icepbix@gmail.com

--000000000000f7ac4b05eabee4bd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All,<div><br><div>Now I work with intel-ipmi-oem and wa=
nt to get=C2=A0smbios blob.=C2=A0</div><div>I use intel-ipmi-oem lib and ip=
mi-whitelist.conf with phosphor-host-ipmid.</div><div><br></div><div>I test=
 this by ipmitool like this ipmitool raw 0x30 0x1a and get:</div><div>Unabl=
e to send RAW command (channel=3D0x0 netfn=3D0x30 lun=3D0x0 cmd=3D0x1a rsp=
=3D0xc1): Invalid command</div><div>=C2=A0In journalctl:<br></div><div>Oct =
11 09:06:43 QV-00002-3a1b4b0da2c0 ipmid[278]: Channel/NetFn/Cmd not whiteli=
sted<br></div><div><br></div><div>How I can debug=C2=A0 this ?</div><div><b=
r></div><div>Are there any examples how=C2=A0to get blob=C2=A0with=C2=A0int=
el-ipmi-oem ?<br></div><div></div></div><div><br></div>-- <br><div dir=3D"l=
tr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=
=3D"ltr"><div>Best Regards,</div><div>Nikita Pavlov</div><div>E-mail:=C2=A0=
<a href=3D"mailto:icepbix@gmail.com" target=3D"_blank">icepbix@gmail.com</a=
></div></div></div></div>

--000000000000f7ac4b05eabee4bd--
