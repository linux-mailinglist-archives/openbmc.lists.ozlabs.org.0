Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA6B15C9B8
	for <lists+openbmc@lfdr.de>; Thu, 13 Feb 2020 18:48:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48JPBY6c0FzDqTs
	for <lists+openbmc@lfdr.de>; Fri, 14 Feb 2020 04:48:37 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::134;
 helo=mail-lf1-x134.google.com; envelope-from=rhanley@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=ODIH81SS; dkim-atps=neutral
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48JP9s5vY9zDqTd
 for <openbmc@lists.ozlabs.org>; Fri, 14 Feb 2020 04:48:01 +1100 (AEDT)
Received: by mail-lf1-x134.google.com with SMTP id f24so4887928lfh.3
 for <openbmc@lists.ozlabs.org>; Thu, 13 Feb 2020 09:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6VtDCM/fuJXzT1pB065gkoRvrtPTefGRNunuQU0zr3A=;
 b=ODIH81SS1wpyDKG2BHtR0Dxr8PwrlJmPbqYJP+kOypsppWC7v66hjVdFEPwENm/BnR
 iJrTgUcPOndFgwhzgHji8OlOfGx9LIhmJL9/uAHAPy6unGsVCt/8/lF4xVqb1vyOKbup
 ySib18ejSuaLmJaZE1EVJ7BHMp0hnFVTbWabI+my8ZdKdUy3NxrPALFD2uT2CiWQ1qUh
 bbxC9cw00UQ0acGTeSsF6y8qUJN0+9BKObLNzUqcRNCFxtlF/YUs+uXsdDp0Fptn250e
 xYFHBqutJ3K7u1fIWX+iedf6pKW4JAiLMrJILhUYmQE7GnYoQQB30P1FZ+x2RC/ENntH
 DjoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6VtDCM/fuJXzT1pB065gkoRvrtPTefGRNunuQU0zr3A=;
 b=DSCurCOKOvsz+fDGDWo/Ucp1SN7aDQvbq4+pHAyI2VuBZXp2Q8v8OoTbbtO77Olzc7
 UGLwNP5PFtK8jcjblyeE6HwG1EtmonB1OsQfyzrQn9tWML1wqKoUa2CyxRyRzbsA1ljR
 8O9cwsrS0r58Ky71Q2jbUr0FJl671o9MG1Kc5rV1PCzDYYRqtjQHzXDwFWw1rGSZsGSb
 wu/F/gWIJcaAWJfCFrVKGsyHDTm75vk5mQqk2NMVhoGMLZb2ge6WnbXmA+gRJ7KtdBvf
 Fx6Mq8J1nS47SmVxjFfNU+By4NukLH0DALQKaDhifa5hLS7bPDIHoz1oXnrK1X/2DiBa
 Bs0A==
X-Gm-Message-State: APjAAAUJeDrjAOKj8Ss+xFFB1ay5KooVmRbDC84EuT93qA5+eozRH++8
 d5GbiyZjsbx8qpPSUwYmrvkhYLq8GezuL1Xp/ArFrg==
X-Google-Smtp-Source: APXvYqxCFBt71xPV+FiC9gv42Ei9YtDa8vGVbneN1IkyjaAMvHxyxd46fC7ClxlEUWhWJnSVN28Ky7FNDf4cGZlHpOM=
X-Received: by 2002:ac2:4c2b:: with SMTP id u11mr9884878lfq.46.1581616074205; 
 Thu, 13 Feb 2020 09:47:54 -0800 (PST)
MIME-Version: 1.0
References: <98c85219-dc21-8012-09c9-6285c7a7a235@linux.vnet.ibm.com>
 <20200121215816.GB59535@patrickw3-mbp.dhcp.thefacebook.com>
 <392a6aa8-384d-6973-fa6e-0ad383497296@linux.vnet.ibm.com>
In-Reply-To: <392a6aa8-384d-6973-fa6e-0ad383497296@linux.vnet.ibm.com>
From: Richard Hanley <rhanley@google.com>
Date: Thu, 13 Feb 2020 09:47:43 -0800
Message-ID: <CAH1kD+bw1pbDPqK_qDa4_sipgnGog_6YbLQarCJke5RgOiGYsg@mail.gmail.com>
Subject: Re: Add OEM Interface in bmcweb
To: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Content-Type: multipart/alternative; boundary="00000000000046a24f059e78b0a5"
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

--00000000000046a24f059e78b0a5
Content-Type: text/plain; charset="UTF-8"

This is an area where I think we need to make some clearer distinctions on
what OEM means.  By that I mean there are two main use cases of OEM fields:

1) OEM fields that are directly part of the phosphor reference
implementation used in all of OpenBMC
2) OEM fields that are used for individual projects or corporations.

Minimizing number 1 is a really good goal, because we should be able to use
Redfish by default in OpenBMC without needing any OEM fields. Moreover any
fields that are generally needed in OpenBMC should be adopted by DMTF.

However, that second use case is really really different.   For example, we
have some incredibly specific requirements about providing a detailed
physical model of the machine to the rest of the datacenter.  When we
approached DMTF about this, their recommendation was to graft this metadata
into the assemblies (which is a very reasonable way to accomplish that).
As it stands right now, I don't have a really clear idea on how to
sustainably add that into bmcweb.  This problem gets more thorny if a
company wants to add Redfish support for a custom ASIC.

This is a balancing act that I think needs to be addressed in some
fashion.  One possible way to square this circle is to work with DMTF on
creating Redfish profiles.  That way we can have a core library that allows
for the easy pluggability and ad-hoc support, but then have standard
profiles that clients can design around.  I know that DMTF is very
interested in creating profiles, and this might be a use case that helps
drive that.

Regards,
Richard

On Thu, Feb 13, 2020 at 12:36 AM Ratan Gupta <ratagupt@linux.vnet.ibm.com>
wrote:

>
> On 22/01/20 3:28 AM, Patrick Williams wrote:
>
> On Mon, Jan 20, 2020 at 12:43:57PM +0530, Ratan Gupta wrote:
>
> 1) Introduce a compile time flag in the bmcweb
>
> 2) Put all the OEM specific interface functionalities in the new files.
>
> 3) Include the new files under the compile time flag as majority of the code
> in bmcweb written in header file.
>
>
> Do we want OEM commands to be in bmcweb also?
>
> Yes Redfish has a support for the same, However we want to minimize the
> need as much as possible by
> 1) Put across your need in the community and find out if this is a common
> requirement
> 2) If it is a common requirement across the openBMC community then propose
> it in the DMTF.
>
>  Or more of a plugin
> nature like the IPMI implementation?
>
> We tried the same earlier in the community call and discussed that we
> should avoid it for the following reason.
>
>    - People will start using the Oem here and there and the community
>    will never know the requirement which can be standardized.
>
>
> It seems to me that there will be OEM commands that are not open source
> either due to NDAs on certain hardware or secret sauce in data center
> management software that various cloud vendors have.
>
> Yes certain OEM cmds would be there which can not be standardized.
>
> Ratan
>

--00000000000046a24f059e78b0a5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This is an area where I think we need to make some clearer=
 distinctions on what OEM means.=C2=A0 By that I mean there are two main us=
e cases of OEM fields:<div><br></div><div>1) OEM fields that are directly p=
art of the phosphor reference implementation used in all of OpenBMC</div><d=
iv>2) OEM fields that are used for individual projects or corporations.</di=
v><div><br></div><div>Minimizing=C2=A0number 1 is a really good goal, becau=
se we should be able to use Redfish by default in OpenBMC without needing a=
ny OEM fields. Moreover any fields that are generally needed in OpenBMC sho=
uld be adopted by DMTF.</div><div><br></div><div>However, that second use c=
ase is really really different.=C2=A0 =C2=A0For example, we have some incre=
dibly specific requirements about providing a detailed physical model of th=
e machine to the rest of the datacenter.=C2=A0 When we approached DMTF abou=
t this, their recommendation was to graft this metadata into the assemblies=
 (which is a very reasonable way to accomplish that).=C2=A0 As it stands ri=
ght now, I don&#39;t have a really clear idea on how to sustainably add tha=
t into bmcweb.=C2=A0 This problem gets more thorny if a company wants to ad=
d Redfish support for a custom ASIC.</div><div><br></div><div>This is a bal=
ancing=C2=A0act that I think needs to be addressed in some fashion.=C2=A0 O=
ne possible way to square this circle is to work with DMTF on creating Redf=
ish profiles.=C2=A0 That way we can have a core library that allows for the=
 easy pluggability and ad-hoc support, but then have standard profiles that=
 clients can design around.=C2=A0 I know that DMTF is very interested in cr=
eating profiles, and this might be a use case that helps drive that.</div><=
div><br></div><div>Regards,</div><div>Richard</div></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 13, 2020 at =
12:36 AM Ratan Gupta &lt;<a href=3D"mailto:ratagupt@linux.vnet.ibm.com">rat=
agupt@linux.vnet.ibm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF">
    <p><br>
    </p>
    <div>On 22/01/20 3:28 AM, Patrick Williams
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <pre>On Mon, Jan 20, 2020 at 12:43:57PM +0530, Ratan Gupta wrote:
</pre>
      <blockquote type=3D"cite">
        <pre>1) Introduce a compile time flag in the bmcweb
</pre>
      </blockquote>
      <pre></pre>
      <blockquote type=3D"cite">
        <pre>2) Put all the OEM specific interface functionalities in the n=
ew files.

3) Include the new files under the compile time flag as majority of the cod=
e
in bmcweb written in header file.

</pre>
      </blockquote>
      <pre>Do we want OEM commands to be in bmcweb also? </pre>
    </blockquote>
    <tt>Yes Redfish has a support for the same, However we want to
      minimize the need as much as possible by</tt><tt><br>
    </tt><tt>1) Put across your need in the community and find out if
      this is a common requirement</tt><tt><br>
    </tt><tt>2) If it is a common requirement across the openBMC
      community then propose it in the DMTF.</tt><br>
    <blockquote type=3D"cite">
      <pre> Or more of a plugin
nature like the IPMI implementation?</pre>
    </blockquote>
    <tt>We tried the same earlier in the community call and discussed
      that we should avoid it for the following reason</tt><tt>.<br>
    </tt>
    <ul>
      <li><tt>People will start using the Oem here and there and the
          community will never know the requirement which can be
          standardized.</tt><br>
      </li>
    </ul>
    <br>
    <blockquote type=3D"cite">
      <pre>It seems to me that there will be OEM commands that are not open=
 source
either due to NDAs on certain hardware or secret sauce in data center
management software that various cloud vendors have.
</pre>
    </blockquote>
    <tt>Yes certain OEM cmds would be there which can not be
      standardized.</tt><br>
    <blockquote type=3D"cite">
      <pre></pre>
    </blockquote>
    Ratan<br>
  </div>

</blockquote></div>

--00000000000046a24f059e78b0a5--
