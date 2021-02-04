Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E2330EED2
	for <lists+openbmc@lfdr.de>; Thu,  4 Feb 2021 09:48:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWXK33wn3zDwvW
	for <lists+openbmc@lfdr.de>; Thu,  4 Feb 2021 19:48:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635;
 helo=mail-pl1-x635.google.com; envelope-from=manojkiran.eda@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ZtVP1gKl; dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DWXHr2X0ZzDwhK
 for <openbmc@lists.ozlabs.org>; Thu,  4 Feb 2021 19:47:49 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id x9so1392710plb.5
 for <openbmc@lists.ozlabs.org>; Thu, 04 Feb 2021 00:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:message-id:in-reply-to:references:subject
 :mime-version; bh=BDmD8EPgrHVWddmPHwU6u4I1Q3EIluMG79Hi1tZntHs=;
 b=ZtVP1gKl7U/Q4FOqJTr8a7mXLX7J83ySeX6dyPr9y4ER57ibu8C/jxHFDTvSQUOHnk
 04cTqYrE1qejA43Cbo9fXgyp3FF393PFPaETt+xumfd8mOQcIkk66+DZx+X34VSTCueV
 ghViE4zgn0v74dCOqT2TjleZ5yhtIAVlx2uwqKLSxZV1l2me+KFdMsS4QSINAzoV+KEs
 yvbg6OATRAzaAysXWGU4ucfrjK6F5W4LL8LzpAGwm7wy7PoVlSxfpzN8dynnDN2kGZ3D
 fxemcPx1brA9/DMFLkG1Y/+9+RBEDhwS9wiVz12xRVEnkgWn6Skl3E97QF/3JBv1VP0W
 nVDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
 :references:subject:mime-version;
 bh=BDmD8EPgrHVWddmPHwU6u4I1Q3EIluMG79Hi1tZntHs=;
 b=IdC8tBdoPhqzIKsFHRg1WPWtJ5ROZDHEkKW85F+SFRT6qsjukrkwPKSxoAjH6Gxj7W
 XVHIOoffy3yTu/fT49AzIvcNdcuiouPIujFXm37w9XXwFhHqkm8oV1YDYXTf5/G3GZd4
 3hv3pFHYPKuLDznIOUxgj1NExyhFxBa9h2a0ks89NMFhOpcs+hXH83ju57V9DJtgNL5t
 l2RABlfNFAJXvQGE9lCuySSb0m4in84+DVFBY9pdn8gIrAh02rIFMruLzM/TlCtVBPvA
 p7S56uaXUGc10GMEI7FEm7TB2c6EGAPKMm70fZ7YWwWqQnM2CBOOVaSE30IoB4TbyKZV
 T6Sw==
X-Gm-Message-State: AOAM530zWi1EQOHQTavPJyu1NzRa90nd8q6+YrEvsvpilSnrHxT629LC
 ezNCJQzq/qAHMmnsRmVMwrvbyiHLbPM+/w==
X-Google-Smtp-Source: ABdhPJzPdQezuaF46EQBLX1LiWig7HM+46TfRwO4PtWV6BzoprRaR4PlZE6etRhb0nXOvK9baYTUYA==
X-Received: by 2002:a17:902:f541:b029:de:ae4d:2c7b with SMTP id
 h1-20020a170902f541b02900deae4d2c7bmr7191436plf.62.1612428464651; 
 Thu, 04 Feb 2021 00:47:44 -0800 (PST)
Received: from juliet ([183.82.158.140])
 by smtp.gmail.com with ESMTPSA id z18sm4758769pfq.68.2021.02.04.00.47.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 04 Feb 2021 00:47:43 -0800 (PST)
Date: Thu, 4 Feb 2021 14:17:37 +0530
From: manoj kiran <manojkiran.eda@gmail.com>
To: "=?utf-8?Q?openbmc=40lists.ozlabs.org?=" <openbmc@lists.ozlabs.org>
Message-ID: <92FA1C68-B326-4562-97DB-0D1D56648197@getmailspring.com>
In-Reply-To: <YBi83kwe6SZqkcq0@heinlein>
References: <YBi83kwe6SZqkcq0@heinlein>
Subject: Re: Progress Codes in BMC
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="601bb4a9_27838f5c_111c"
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
Cc: "=?utf-8?Q?kunyi731=40gmail.com?=" <kunyi731@gmail.com>,
 "=?utf-8?Q?ed=40tanous.net?=" <ed@tanous.net>,
 "=?utf-8?Q?benjaminfair=40google.com?=" <benjaminfair@google.com>,
 "=?utf-8?Q?anoo=40us.ibm.com?=" <anoo@us.ibm.com>,
 "=?utf-8?Q?deepak.kodihalli.83=40gmail.com?=" <deepak.kodihalli.83@gmail.com>,
 "=?utf-8?Q?gmills=40linux.ibm.com?=" <gmills@linux.ibm.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 "=?utf-8?Q?vishwa=40linux.ibm.com?=" <vishwa@linux.ibm.com>,
 Supreeth Venkatesh <supreeth.venkatesh@amd.com>,
 "=?utf-8?Q?jason.m.bills=40linux.intel.com?=" <jason.m.bills@linux.intel.com>,
 "=?utf-8?Q?vijaykhemka=40fb.com?=" <vijaykhemka@fb.com>,
 "=?utf-8?Q?wak=40google.com?=" <wak@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--601bb4a9_27838f5c_111c
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi All,

Thanks to everyone for all the implementation ideas on this thread.
After understanding all the inputs from the community , we were planning to proceed forward with using the existing infrastructure provided by phosphor-host-postd, phosphor-post-code-manager repo's & leverage the BIOS POSTCode Log service to do the job.
The plan is to start with minimal working pieces. On the first go we are planning to come up with patchsets that will do the following:
1.Come up with a compilation flag & make sure phosphor-host-postd still hosts the dbus interface even if it does not see the snoop port.
2.PLDM will receive the 72bytes of progress code from the hypervisor via File I/O, and then just send the first 8 bytes(discard everything else) to the existing Raw Property & use the existing redfish BIOS Post Code log service to check if things are working.

In the next iteration :
1. We will try to modify the existing dbus property (Boot.Raw) to array[byte] & the piece of code that uses this property in other repos including the post-code-manager.
2. There might be a need to Modify/Add new interfaces used by post-code-manager to parse the buffer & host the dbus objects to such an extent that an AdditionalDataURI can be given to clients(base64 encoded buffer) apart from filling the existing redfish message registry.

Does the community foresee any issues/problems if we stick to the above-mentioned plan?
Thanks,
Manoj

On Feb 2 2021, at 8:15 am, Patrick Williams <patrick@stwcx.xyz> wrote:
> On Mon, Feb 01, 2021 at 07:21:39PM -0500, Brad Bishop wrote:
> > On Sat, Jan 30, 2021 at 08:31:26AM -0600, Patrick Williams wrote:
> > >On Wed, Jan 27, 2021 at 08:05:26PM -0500, Brad Bishop wrote:
> > >>
> > >> There are multiple sources of the codes - on Power the power sequencing
> > >> is done on the BMC and that is considered part of the server boot so we
> > >> have both those applications indicating their progress along with the
> > >> more traditional progress flowing down from system firmware.
> > >
> > >The `xyz.openbmc_project.State.Boot.Raw` is the interface to use here.
> > >You just write the `Value` property.
> >
> > Ok. Do I have it right - on any application that wants to post a
> > "progress code" you would just implement this interface on a single
> > (arbitrary?) path and continually write to the Value property?
>
> I think it is even simpler than that. You just need to make a dbus
> client call to write to the Boot.Raw value. This might happen from your
> boot sequence on the BMC-side or from PLDM for the Host-side.
>
> You will want the phosphor-post-code-manager application running, which will
> listen to the PropertyChanged signals from Boot.Raw and keep the running
> history for you.
>
> There is also phosphor-host-postd. Currently it has an implementation
> that looks at LPC to get the post codes. There was a proposed
> implementation [1] that added multi-host support and I think support to
> get the value directly from dbus client writes to Boot.Raw instead of
> the lpc-snoop method. Then there is code in fb-ipmi-oem that writes the
> results of some IPMB messages into the Boot.Raw value[2]. Looking at
> this I'm not positive that all the pieces are all there, but I think it
> is mostly there. Maybe check with the author on 1 to see where it is
> at.
>
> This design doc might be useful too [3].
> 1. https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-host-postd/+/36509
> 2. https://github.com/openbmc/fb-ipmi-oem/blob/master/src/biccommands.cpp#L76
> 3. https://github.com/openbmc/docs/blob/master/designs/multi-host-postcode.md
>
> --
> Patrick Williams
>


--601bb4a9_27838f5c_111c
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<div>Hi All,</div><br><div>Thanks to everyone for all the implementation =
ideas on this thread.</div><br><div>After understanding all the inputs fr=
om the community , we were planning to proceed forward with using the exi=
sting infrastructure provided by phosphor-host-postd, phosphor-post-code-=
manager repo's &amp; leverage the BIOS POSTCode Log service to do the job=
.</div><br><div>The plan is to start with minimal working pieces. On the =
first go we are planning to come up with patchsets that will do the follo=
wing:</div><br><div>1.Come up with a compilation flag &amp; make sure pho=
sphor-host-postd still hosts the dbus interface even if it does not see t=
he snoop port.</div><div>2.PLDM will receive the 72bytes of progress code=
 from the hypervisor via =46ile I/O, and then just send the first 8 bytes=
(discard everything else) to the existing Raw Property &amp; use the exis=
ting redfish BIOS Post Code log service to check if things are working.</=
div><br><div>In the next iteration :</div><div>1. We will try to modify t=
he existing dbus property (Boot.Raw) to array=5Bbyte=5D &amp; the piece o=
f code that uses this property in other repos including the post-code-man=
ager.</div><div>2. There might be a need to Modify/Add new interfaces use=
d by post-code-manager to parse the buffer &amp; host the dbus objects to=
 such an extent that an AdditionalDataURI can be given to clients(base64 =
encoded buffer) apart from filling the existing redfish message registry.=
</div><br><div>Does the community foresee any issues/problems if we stick=
 to the above-mentioned plan=3F</div><br><div>Thanks,</div><div>Manoj </d=
iv><br><div class=3D=22gmail=5Fquote=5Fattribution=22>On =46eb 2 2021, at=
 8:15 am, Patrick Williams &lt;patrick=40stwcx.xyz&gt; wrote:</div><block=
quote><div><div>On Mon, =46eb 01, 2021 at 07:21:39PM -0500, Brad Bishop w=
rote:</div><div>&gt; On Sat, Jan 30, 2021 at 08:31:26AM -0600, Patrick Wi=
lliams wrote:</div><div>&gt; &gt;On Wed, Jan 27, 2021 at 08:05:26PM -0500=
, Brad Bishop wrote:</div><div>&gt; &gt;&gt;</div><div>&gt; &gt;&gt; Ther=
e are multiple sources of the codes - on Power the power sequencing</div>=
<div>&gt; &gt;&gt; is done on the BMC and that is considered part of the =
server boot so we</div><div>&gt; &gt;&gt; have both those applications in=
dicating their progress along with the</div><div>&gt; &gt;&gt; more tradi=
tional progress flowing down from system firmware.</div><div>&gt; &gt;</d=
iv><div>&gt; &gt;The =60xyz.openbmc=5Fproject.State.Boot.Raw=60 is the in=
terface to use here.</div><div>&gt; &gt;You just write the =60Value=60 pr=
operty.</div><div>&gt;</div><div>&gt; Ok. Do I have it right - on any app=
lication that wants to post a</div><div>&gt; =22progress code=22 you woul=
d just implement this interface on a single</div><div>&gt; (arbitrary=3F)=
 path and continually write to the Value property=3F</div><br><div>I thin=
k it is even simpler than that. You just need to make a dbus</div><div>cl=
ient call to write to the Boot.Raw value. This might happen from your</di=
v><div>boot sequence on the BMC-side or from PLDM for the Host-side.</div=
><br><div>You will want the phosphor-post-code-manager application runnin=
g, which will</div><div>listen to the PropertyChanged signals from Boot.R=
aw and keep the running</div><div>history for you.</div><br><div>There is=
 also phosphor-host-postd. Currently it has an implementation</div><div>t=
hat looks at LPC to get the post codes. There was a proposed</div><div>im=
plementation =5B1=5D that added multi-host support and I think support to=
</div><div>get the value directly from dbus client writes to Boot.Raw ins=
tead of</div><div>the lpc-snoop method. Then there is code in fb-ipmi-oem=
 that writes the</div><div>results of some IPMB messages into the Boot.Ra=
w value=5B2=5D. Looking at</div><div>this I'm not positive that all the p=
ieces are all there, but I think it</div><div>is mostly there. Maybe chec=
k with the author on 1 to see where it is</div><div>at.</div><br><div>Thi=
s design doc might be useful too =5B3=5D.</div><br><div>1. https://gerrit=
.openbmc-project.xyz/c/openbmc/phosphor-host-postd/+/36509</div><div>2. h=
ttps://github.com/openbmc/fb-ipmi-oem/blob/master/src/biccommands.cpp=23L=
76</div><div>3. https://github.com/openbmc/docs/blob/master/designs/multi=
-host-postcode.md</div><br><div>--</div><div>Patrick Williams</div></div>=
</blockquote>
--601bb4a9_27838f5c_111c--

