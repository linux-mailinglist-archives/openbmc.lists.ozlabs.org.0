Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 13827867F0
	for <lists+openbmc@lfdr.de>; Thu,  8 Aug 2019 19:26:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 464Fdr4KrwzDqs3
	for <lists+openbmc@lfdr.de>; Fri,  9 Aug 2019 03:26:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="ExAIpn/a"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 464Fd21TfbzDqpg
 for <openbmc@lists.ozlabs.org>; Fri,  9 Aug 2019 03:25:25 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id r1so44462720pfq.12
 for <openbmc@lists.ozlabs.org>; Thu, 08 Aug 2019 10:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lPkuIRjZuZeiLILg7B7CnC9j4CAMIX33MRzDzFL4BMg=;
 b=ExAIpn/aFSNvjfyPhbk7aVw+7WUX2aVESg6OMCNxqlazeftkaFAporsU9pPtlckDMq
 fekS31anXVuYsqd3g0RiYSp0OZcTQ57m7Fh2F3KqSUMUFSZLAUoYPmrQKrUzPRE27POq
 +A8JgXwL1wecPQKfmv3TQwj+dcQyWyJ/mHfo4OBg5TyBpXPBYTaWpJWLeQy9/zt230ut
 eicIwFxxRJVH8qPRZNaorCxynQ2EmXBPA6RYi8/5xLshP+p3tSBCL8zRxU4Rep+iGqyy
 RK4GGIqOiEvPczLrGa4HYTK5JFwKW8emBVKppJ8JSB6OvyX4Y8GFrACeJ5J/bQmVyoM3
 4VVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lPkuIRjZuZeiLILg7B7CnC9j4CAMIX33MRzDzFL4BMg=;
 b=Z/7Q2dvUGih02mt8b+cR2DNqQD0vqn2yRvPxz6fLMU+yLIha0w3bRLiy/mvHEIyb0/
 svwOTl9EKZI/9z8m+z5boCDMFnSz5xmBJ7tnJ/Gr0NsJqRJjHWrptQU9VV7rC41PgQ2Q
 RMAi7D3vo8if7m46eyRRSZsrwBMPoAktzaVmBsUILdH1xDmJlQQwfl6t7ZalIsCBO+i1
 ETzfJi3+lZU4/OYrGlu/fZuV6i1OQ87twQmqIrSdum274wkWYLiqbHFzh4zIqJv64jvv
 21enkLKCXfAmJY3NhgjFV4ZFcAjaemUp7+ezwC9eaiMs90PztIV59zN4RQqxGZR9uUW9
 gpfA==
X-Gm-Message-State: APjAAAUtKOEmWiZf5BKCFQtu2x7mkoy+DIoVDEymTRfLokpFUyERhqiH
 6vv0A31rHfnIn/sGOP06v1FcVEr6RSk4ltxZGw+9xw==
X-Google-Smtp-Source: APXvYqziv3ZOM5U6QHICZ2/ntYBE/tPpsJk10bxbcgdV686JeAMnI4KvReOgsPYP6637IdFLPtx7KmPuOTmiy/NJaJc=
X-Received: by 2002:a65:6288:: with SMTP id f8mr13474711pgv.292.1565285121968; 
 Thu, 08 Aug 2019 10:25:21 -0700 (PDT)
MIME-Version: 1.0
References: <95784a9aed5d4f269fdf95684500d48e@lenovo.com>
 <CAO=notyC=6U8Afq8yOPxW0e933kXq3ubTVR5mc3WVGBhd4F08g@mail.gmail.com>
 <CAO=notwQv43Nbe9nUfzFDM1GYDqc6u6Oro83BGdcZ1rjePu-hg@mail.gmail.com>
 <CAO=notyQpRiwYMsGY83DyvaM-a_c+fCpguFyFW4dqQz3_yWWjA@mail.gmail.com>
 <CAO=notzWsPKqV_+rgm=Hzv27YfoRQtz8OPwVDOmGuvRS20BDwA@mail.gmail.com>
 <CAO=notwQ52OeLrFNisQyfj__3LuEE2u_48FhdcApUDyOGYOovQ@mail.gmail.com>
 <c2042ca491d34de99777995068b603af@lenovo.com>
 <CAO=notxM06wb8asmujXT2ney+fr1sHhU4yjRN0ENhn=jkhydhw@mail.gmail.com>
 <b8f6076bb4f14007ad21d50bb9c30735@lenovo.com>
In-Reply-To: <b8f6076bb4f14007ad21d50bb9c30735@lenovo.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 8 Aug 2019 10:25:10 -0700
Message-ID: <CAO=notzvGgcpFPTrTzDJ-gSopw=mqTBVum1Ni55NA3xCqmaMOw@mail.gmail.com>
Subject: Re: [External] Re: Clarify some questions about BIOS update
 (phosphor-ipmi-flash)
To: Andrew MS1 Peng <pengms1@lenovo.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Aug 8, 2019 at 1:21 AM Andrew MS1 Peng <pengms1@lenovo.com> wrote:
>
> Hi Patrick,
>
> 1. Following your suggestion to modify the json file, but encountered an =
error message as "Parsing json failed ". Please help to take a look at it, =
thanks.
>         A part of config-bios.json(default) content and journalctl log wa=
s below.
>                 "update": {
>                         "type": "systemd",
>                         "unit": "phosphor-ipmi-flash-bios-update.target"
>                 }
>
>         Aug 07 06:54:22 hr630 ipmid[507]: Registering OEM:[0X00C2CF], Cmd=
:[0X80] for Blob Commands
>         Aug 07 06:54:22 hr630 ipmid[507]: config loaded: /flash/bios
>         Aug 07 06:54:22 hr630 ipmid[507]: config loaded: /flash/image
>
>
>         A part of config-bios.json(modification) content and journalctl l=
og was below.
>                 "update": {
>                         "type": "fileSystemdUpdate",
>                         "unit": "phosphor-ipmi-flash-bios-update.target" =
<--- missing comma.
>                         "path": "/tmp/bios.update"
>                 }
>
>         Aug 07 06:33:12 hr630 ipmid[498]: Registering OEM:[0X00C2CF], Cmd=
:[0X80] for Blob Commands
>         Aug 07 06:33:12 hr630 ipmid[498]: Parsing json failed
>         Aug 07 06:33:12 hr630 ipmid[498]: config loaded: /flash/image
>
> 2. Which one is the best way to modify json file in OpenBmc, patch or ove=
rwrite? I added lenovo-bios-update.bb to handle service and script. I encou=
ntered an error message as "file conflicts" when I added new file of json t=
o overwrite original file. What should I do to fix it?
>                 The error message is below.
>                         Error: Transaction check error:
>                         file /usr/share/phosphor-ipmi-flash/config-bios.j=
son conflicts between attempted installs of phosphor-ipmi-flash-1.0+git999-=
r1.armv6 and lenovo-bios-update-1.0-r0.armv6
>
>                 A part of lenovo-bios-update.bb content is below.
>                         SRC_URI +=3D " \
>                         file://bios-verify.service \
>             file://bios-verify.sh \
>             file://bios-update.service \
>             file://bios-update.sh \
>             file://config-bios.json \
>             "
>                         DEPENDS +=3D "systemd"
>                         RDEPENDS_${PN} =3D "bash"
>                         SYSTEMD_PACKAGES =3D "${PN}"
>                         SYSTEMD_SERVICE_${PN} =3D "bios-verify.service bi=
os-update.service"
>                         do_install() {
>                         install -d ${D}/usr/sbin
>                         install -d ${D}/usr/share/phosphor-ipmi-flash/
>                         install -m 0755 ${S}bios-verify.sh ${D}/${sbindir=
}/
>                                 install -m 0755 ${S}bios-update.sh ${D}/$=
{sbindir}/
>                         install -m 0644 ${S}config-bios.json ${D}/usr/sha=
re/phosphor-ipmi-flash/
>                         }
>                         FILES_${PN} =3D " \
>                         /usr/share/phosphor-ipmi-flash/config-bios.json \
>                         ${sbindir}/bios-update.sh \
>                         ${sbindir}/bios-verify.sh \
>                 "
> Regards,
> Andrew
>
>
> -----=E9=82=AE=E4=BB=B6=E5=8E=9F=E4=BB=B6-----
> =E5=8F=91=E4=BB=B6=E4=BA=BA: Patrick Venture <venture@google.com>
> =E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4: 2019=E5=B9=B48=E6=9C=887=E6=97=A5 2=
3:36
> =E6=94=B6=E4=BB=B6=E4=BA=BA: Andrew MS1 Peng <pengms1@lenovo.com>
> =E6=8A=84=E9=80=81: openbmc@lists.ozlabs.org
> =E4=B8=BB=E9=A2=98: Re: [External] Re: Clarify some questions about BIOS =
update (phosphor-ipmi-flash)
>
> On Wed, Aug 7, 2019 at 4:47 AM Andrew MS1 Peng <pengms1@lenovo.com> wrote=
:
> >
> > Hi Patrick,
> >
> > The triggered "phosphor-ipmi-flash-bios-update.target" seems to been so=
lved, but the BIOS update status has not yet been fixed.
> > Could we add checking the contents of the file in SystemdUpdateMechanis=
m::status() function of update_systemd.cpp such as verification mechanism S=
ystemdWithStatusFile::status() of general_systemd.cpp?
>
> You can just use the type "fileSystemdUpdate" which let you check a path =
for the status.
>
> The three parameters for that update type are the same as the verificatio=
n type that matches:
>  - path - the filesystem path containing the status
>  - unit - the target "phosphor-ipmi-flash-bios-update.target"
>  - mode - optional job-mode parameter, defaults to "replace"
>
> >
> > Regards,
> > Andrew
> >
> > -----=E9=82=AE=E4=BB=B6=E5=8E=9F=E4=BB=B6-----
> > =E5=8F=91=E4=BB=B6=E4=BA=BA: Patrick Venture <venture@google.com>
> > =E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4: 2019=E5=B9=B48=E6=9C=886=E6=97=A5=
 4:39
> > =E6=94=B6=E4=BB=B6=E4=BA=BA: Andrew MS1 Peng <pengms1@lenovo.com>
> > =E6=8A=84=E9=80=81: openbmc@lists.ozlabs.org; Duke KH Du <dukh@lenovo.c=
om>; Yonghui
> > YH21 Liu <liuyh21@lenovo.com>; Lisa YJ19 Liu <liuyj19@lenovo.com>
> > =E4=B8=BB=E9=A2=98: [External] Re: Clarify some questions about BIOS up=
date
> > (phosphor-ipmi-flash)
> >
> > On Mon, Aug 5, 2019 at 10:39 AM Patrick Venture <venture@google.com> wr=
ote:
> > >
> > > On Mon, Aug 5, 2019 at 9:39 AM Patrick Venture <venture@google.com> w=
rote:
> > > >
> > > > On Mon, Aug 5, 2019 at 9:32 AM Patrick Venture <venture@google.com>=
 wrote:
> > > > >
> > > > > On Mon, Aug 5, 2019 at 9:17 AM Patrick Venture <venture@google.co=
m> wrote:
> > > > > >
> > > > > > On Mon, Aug 5, 2019 at 4:56 AM Andrew MS1 Peng <pengms1@lenovo.=
com> wrote:
> > > > > > >
> > > > > > > Hi Patrick,
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > I have some questions about BIOS update via phosphor-ipmi-fla=
sh with L2A, please help to clarify. Thanks.
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > >
> > > > > > Thanks for giving it a shot!  I don't have any systems using
> > > > > > this for BIOS update, so I'm curious where there may be issues
> > > > > > lurking :)
> > > > > >
> > > > > >
> > > > > > > 1. How can I update the status (success or failure) after upg=
rade BIOS firmware? Currently, the update status only appear "running".
> > > > > > >
> > > > > >
> > > > > > I see, the update mechanism doesn't have a verification option.
> > > > > > A bit of an oversight.  I'll have something up for review
> > > > > > later today.  Then it'll be something you configure similarly
> > > > > > to the verifySystemd json entry.
> > > > > >
> > > > > > > 2. It was failed when triggered "phosphor-ipmi-flash-bios-upd=
ate.target" since the job-mode is null string. It can work well when I add =
string "replace" to job-mode. How can I config (json file or configure para=
meter) to support it?
> > >
> > > This patch will enable you to specify "mode" in the json. *** note:
> > > i will set some time aside shortly to document writing json
> > > configurations.
> > >
> > > https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-ipmi-flash/+/2
> > > 41
> > > 67
> > >
> > > > > >
> > > > > > I'll take a look!  The parameter for job-mode, I thought, was
> > > > > > optional?  Since we don't specify it for other jobs
> > > > > > (verification, etc).  The string should be empty by default
> > > > > > and then not added as a
> > > > > > null-string:
> > > > > >
> > > > > > https://github.com/openbmc/phosphor-ipmi-flash/blob/f0c71df251
> > > > > > 49
> > > > > > 27e933f6fc33d9669ab0663a0706/bmc/update_systemd.cpp#L49
> > > > >
> > > > > I see it is required!  Since I always configure with reboot, I
> > > > > never saw this failure. I'll default it to "replace"
> > > >
> > > > First patch in the series generated from your email:
> > > >
> > > > https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-ipmi-flash/+
> > > > /2
> > > > 4165
> > > >
> > > > Next: json configuration option to control the job-mode.
> > > > Then merge verification and update objects, s.t. you can specify
> > > > the status path.
> >
> > This patchset adds support for a new update configuration that lets you=
 read the status from a file.
> >
> > https://gerrit.openbmc-project.xyz/24171
> >
> > > >
> > > > *** A later patchset can have the status be not a path, but a dbus
> > > > property or dbus path -- if someone wants to implement a new
> > > > object for this, it's somewhat trivial.
> > > >
> > > > >
> > > > > >
> > > > > > I don't think I have a unit-test that verifies the parameters
> > > > > > are sent down properly, so I'll also add that today AND I'll
> > > > > > add an optional mode parameter to the json.
> > > > > >
> > > > > > Sending for review today.
> > > > > >
> > > > > > ...
> > > > > >
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > Regards,
> > > > > > > Andrew
