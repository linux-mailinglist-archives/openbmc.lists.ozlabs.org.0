Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8AA85021
	for <lists+openbmc@lfdr.de>; Wed,  7 Aug 2019 17:41:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 463bM93ZddzDqQZ
	for <lists+openbmc@lfdr.de>; Thu,  8 Aug 2019 01:41:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="d2gCIMh/"; 
 dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 463bFr6Hz7zDqSf
 for <openbmc@lists.ozlabs.org>; Thu,  8 Aug 2019 01:36:32 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id y8so41387031plr.12
 for <openbmc@lists.ozlabs.org>; Wed, 07 Aug 2019 08:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=eo5vZ8tn5QeuWRcBlPSDP7CzeuDOtfHn+KrC4thFf8M=;
 b=d2gCIMh/fIXqmv4sSa9c6x972UGCAn/biupQCQ7BHyyxZIKmQS8uDQbtJl/k5G7jmk
 MMhAxYW5zKIqgA9X838tB6SuFClZ5yCCQX0BBt5vE3Tsk1lz8Qob6S0o5x1WEJiLN4Ue
 0rsKc5bMzChhbTmfKBv12X1nZTpC4R08KiA2iLU2c2sk/4LzsgTLH77rrPMfLgQAhwAH
 vLIyFBCbfox2rsbaLSiMkNo2vxIiy+/hjV0nMbAS6+s+42gwncgnknBovS2uZRthq+1/
 ToV4S0kOANUcZ7Pb8bAbg+cRJ8mLDAgbbWDwOaP3STgSXhNAT4iI0+YuMZQ2xOHZ3N7U
 cltg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eo5vZ8tn5QeuWRcBlPSDP7CzeuDOtfHn+KrC4thFf8M=;
 b=loNrhBDtosApW8CQfiLqZKQ6pse+r+OwgVY+o64EHjspi04sNaxckVetWrmE09RSjV
 MfLQMFCLBDq1j2/f6uW5/vH4tI6rGg0FrJH/J2aHj9Mh7dw8Ti/mpERdwoN5uGhMj9OS
 AF3G9gxiZ7stvvkDFRwGl9LBkN3ZkgzZ+j5MLqc/PwXvZuY1rLOmb5B8PcwEKCgIPR9p
 drg0TvQl4FJOAMv93Ehy9EgVVQ3mZxuevueQ841LrdM2DJGIuIfsZ+NfSZ/CQG3NXcuo
 NPVt/mOcqjC1/CpHsatLt0Jr8dYWYBSMgle7HimBXpFV9vFWlJyple9FAjb6BtxMBUaC
 uKFA==
X-Gm-Message-State: APjAAAUCNFqfC2/DfAibD6ebrAjssX/hJqEEx8wfLgzqEJQbnyLblOjn
 6tYizyP8GKSq/cg9/qcWKFGy9KOsEN1lP7utmbg8Vg==
X-Google-Smtp-Source: APXvYqw46vTJQJkH9TGF/7QTA6HicclC1/9V0KYVXg3KpVOIJWYq+yW9T7NpnyGD3dERMinQi9Efl1TIzaqiTwpm4h0=
X-Received: by 2002:a17:90a:2228:: with SMTP id c37mr524188pje.9.1565192187823; 
 Wed, 07 Aug 2019 08:36:27 -0700 (PDT)
MIME-Version: 1.0
References: <95784a9aed5d4f269fdf95684500d48e@lenovo.com>
 <CAO=notyC=6U8Afq8yOPxW0e933kXq3ubTVR5mc3WVGBhd4F08g@mail.gmail.com>
 <CAO=notwQv43Nbe9nUfzFDM1GYDqc6u6Oro83BGdcZ1rjePu-hg@mail.gmail.com>
 <CAO=notyQpRiwYMsGY83DyvaM-a_c+fCpguFyFW4dqQz3_yWWjA@mail.gmail.com>
 <CAO=notzWsPKqV_+rgm=Hzv27YfoRQtz8OPwVDOmGuvRS20BDwA@mail.gmail.com>
 <CAO=notwQ52OeLrFNisQyfj__3LuEE2u_48FhdcApUDyOGYOovQ@mail.gmail.com>
 <c2042ca491d34de99777995068b603af@lenovo.com>
In-Reply-To: <c2042ca491d34de99777995068b603af@lenovo.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 7 Aug 2019 08:36:16 -0700
Message-ID: <CAO=notxM06wb8asmujXT2ney+fr1sHhU4yjRN0ENhn=jkhydhw@mail.gmail.com>
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

On Wed, Aug 7, 2019 at 4:47 AM Andrew MS1 Peng <pengms1@lenovo.com> wrote:
>
> Hi Patrick,
>
> The triggered "phosphor-ipmi-flash-bios-update.target" seems to been solv=
ed, but the BIOS update status has not yet been fixed.
> Could we add checking the contents of the file in SystemdUpdateMechanism:=
:status() function of update_systemd.cpp such as verification mechanism Sys=
temdWithStatusFile::status() of general_systemd.cpp?

You can just use the type "fileSystemdUpdate" which let you check a
path for the status.

The three parameters for that update type are the same as the
verification type that matches:
 - path - the filesystem path containing the status
 - unit - the target "phosphor-ipmi-flash-bios-update.target"
 - mode - optional job-mode parameter, defaults to "replace"

>
> Regards,
> Andrew
>
> -----=E9=82=AE=E4=BB=B6=E5=8E=9F=E4=BB=B6-----
> =E5=8F=91=E4=BB=B6=E4=BA=BA: Patrick Venture <venture@google.com>
> =E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4: 2019=E5=B9=B48=E6=9C=886=E6=97=A5 4=
:39
> =E6=94=B6=E4=BB=B6=E4=BA=BA: Andrew MS1 Peng <pengms1@lenovo.com>
> =E6=8A=84=E9=80=81: openbmc@lists.ozlabs.org; Duke KH Du <dukh@lenovo.com=
>; Yonghui YH21 Liu <liuyh21@lenovo.com>; Lisa YJ19 Liu <liuyj19@lenovo.com=
>
> =E4=B8=BB=E9=A2=98: [External] Re: Clarify some questions about BIOS upda=
te (phosphor-ipmi-flash)
>
> On Mon, Aug 5, 2019 at 10:39 AM Patrick Venture <venture@google.com> wrot=
e:
> >
> > On Mon, Aug 5, 2019 at 9:39 AM Patrick Venture <venture@google.com> wro=
te:
> > >
> > > On Mon, Aug 5, 2019 at 9:32 AM Patrick Venture <venture@google.com> w=
rote:
> > > >
> > > > On Mon, Aug 5, 2019 at 9:17 AM Patrick Venture <venture@google.com>=
 wrote:
> > > > >
> > > > > On Mon, Aug 5, 2019 at 4:56 AM Andrew MS1 Peng <pengms1@lenovo.co=
m> wrote:
> > > > > >
> > > > > > Hi Patrick,
> > > > > >
> > > > > >
> > > > > >
> > > > > > I have some questions about BIOS update via phosphor-ipmi-flash=
 with L2A, please help to clarify. Thanks.
> > > > > >
> > > > > >
> > > > > >
> > > > >
> > > > > Thanks for giving it a shot!  I don't have any systems using
> > > > > this for BIOS update, so I'm curious where there may be issues
> > > > > lurking :)
> > > > >
> > > > >
> > > > > > 1. How can I update the status (success or failure) after upgra=
de BIOS firmware? Currently, the update status only appear "running".
> > > > > >
> > > > >
> > > > > I see, the update mechanism doesn't have a verification option.
> > > > > A bit of an oversight.  I'll have something up for review later
> > > > > today.  Then it'll be something you configure similarly to the
> > > > > verifySystemd json entry.
> > > > >
> > > > > > 2. It was failed when triggered "phosphor-ipmi-flash-bios-updat=
e.target" since the job-mode is null string. It can work well when I add st=
ring "replace" to job-mode. How can I config (json file or configure parame=
ter) to support it?
> >
> > This patch will enable you to specify "mode" in the json. *** note: i
> > will set some time aside shortly to document writing json
> > configurations.
> >
> > https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-ipmi-flash/+/241
> > 67
> >
> > > > >
> > > > > I'll take a look!  The parameter for job-mode, I thought, was
> > > > > optional?  Since we don't specify it for other jobs
> > > > > (verification, etc).  The string should be empty by default and
> > > > > then not added as a
> > > > > null-string:
> > > > >
> > > > > https://github.com/openbmc/phosphor-ipmi-flash/blob/f0c71df25149
> > > > > 27e933f6fc33d9669ab0663a0706/bmc/update_systemd.cpp#L49
> > > >
> > > > I see it is required!  Since I always configure with reboot, I
> > > > never saw this failure. I'll default it to "replace"
> > >
> > > First patch in the series generated from your email:
> > >
> > > https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-ipmi-flash/+/2
> > > 4165
> > >
> > > Next: json configuration option to control the job-mode.
> > > Then merge verification and update objects, s.t. you can specify the
> > > status path.
>
> This patchset adds support for a new update configuration that lets you r=
ead the status from a file.
>
> https://gerrit.openbmc-project.xyz/24171
>
> > >
> > > *** A later patchset can have the status be not a path, but a dbus
> > > property or dbus path -- if someone wants to implement a new object
> > > for this, it's somewhat trivial.
> > >
> > > >
> > > > >
> > > > > I don't think I have a unit-test that verifies the parameters
> > > > > are sent down properly, so I'll also add that today AND I'll add
> > > > > an optional mode parameter to the json.
> > > > >
> > > > > Sending for review today.
> > > > >
> > > > > ...
> > > > >
> > > > > >
> > > > > >
> > > > > >
> > > > > > Regards,
> > > > > > Andrew
