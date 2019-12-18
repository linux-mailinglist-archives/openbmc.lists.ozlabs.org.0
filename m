Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5FA125285
	for <lists+openbmc@lfdr.de>; Wed, 18 Dec 2019 21:01:01 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47dQqZ6z6SzDqkW
	for <lists+openbmc@lfdr.de>; Thu, 19 Dec 2019 07:00:58 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::134;
 helo=mail-il1-x134.google.com; envelope-from=kunyi@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="O+QL8WAA"; 
 dkim-atps=neutral
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47dQpB0jCLzDqkd
 for <openbmc@lists.ozlabs.org>; Thu, 19 Dec 2019 06:59:45 +1100 (AEDT)
Received: by mail-il1-x134.google.com with SMTP id f5so2765898ilq.5
 for <openbmc@lists.ozlabs.org>; Wed, 18 Dec 2019 11:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ffJOcBFi9pbp0rYFS0FV/hQ2o1qsCTFY1il+o3LOkbM=;
 b=O+QL8WAAVx7452yL6fOuNgfZauT+2xMQTxqC1Z8z7hc54bqn91RG9Q0jFKRTgvRw+O
 I9EJ8ywH9hE1cxToFam5vAvC05fULxymxlLJC9i7WZSH7DhRrGAJBPtLD78lFmwjTnKy
 I1hKt8aG3NYN07efIvrPnuJqgDKRJ5z5/OJNaMbLJM5hMJjgFjvo5yK0So7pwtQWlXzR
 rwPtvB0O/TsgovU/3xGZ1Tq+7w9NyQ6+KSnZV50G1Ngi+hjDs30dhCRfrymkyX/Sw+mu
 Tn8bSumU7N4nMDiQF9G1pBpC7OGQd1AowrN+76OLSeu+k8A/ptHAAIkMsK8u1HmCTtYa
 brog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ffJOcBFi9pbp0rYFS0FV/hQ2o1qsCTFY1il+o3LOkbM=;
 b=Yn5i0JcLQwVdPv3IftLuJGn+KPpA5UT2CF8olbrUN4xLZY/1s55fsogazLeu39dKNX
 8jSPjrTUMcDbbGSj5FnpR1ktH8oPcOsjB44ZLSz390D2WpOP40mFE4e4DG3LCcvXnlLw
 0cdhHmFeCQ0AQaWKyF7kF35TitN15K5m5BXDFKNMjpPFwoFwYqdlXl6hE6k13GVxBuup
 bqwOpqyt98sweW+W8PRQjks4kVjU0BmZvfRFjrY1Y6mkYhd4VDhBJ/Nl8NoVC3f2BHid
 7C2LE3G0ZtmGbvmh142QAD6Qmi3ZlTxrpjakpORtLQmbXFsPzT1wmeXxT6CcQZueqvDO
 bk0w==
X-Gm-Message-State: APjAAAVKWo6W1uDfhv9Z+hDwep0eJEFPPNcTp2JIsnFlcKjNJf17rC+A
 ucVTDyaR5E9MM3lDPsaJtbycjcxc9ziJnkPujGNOCA==
X-Google-Smtp-Source: APXvYqwjSViEUyYhXMo+dpJ2YuTWIVLPT0kQkpa3QuYixmi76HCH8ivQM7gPY6vgLViGJQ5f7VWEDt3A2oe6K6s87lM=
X-Received: by 2002:a92:5805:: with SMTP id m5mr3356977ilb.59.1576699181333;
 Wed, 18 Dec 2019 11:59:41 -0800 (PST)
MIME-Version: 1.0
References: <18332622-cec4-37ae-b617-b897622d0ea2@linux.vnet.ibm.com>
 <FD0BD680739BFC41807C96BD23118BB1321C1D@ORSMSX113.amr.corp.intel.com>
 <8b717e60-5733-c3ef-13ad-7016e89f932a@linux.vnet.ibm.com>
 <20e2aaad-dd30-d9b2-36aa-d07b51f9732b@linux.vnet.ibm.com>
In-Reply-To: <20e2aaad-dd30-d9b2-36aa-d07b51f9732b@linux.vnet.ibm.com>
From: Kun Yi <kunyi@google.com>
Date: Wed, 18 Dec 2019 11:59:14 -0800
Message-ID: <CAGMNF6VnZdkWPUuZR2yThm43gCwxXDu0AVOJ3Wmi5UvOw2s9Sw@mail.gmail.com>
Subject: Re: *Request For Feedback*: TimeOwner in phosphor-timemanager
To: vishwa <vishwa@linux.vnet.ibm.com>
Content-Type: multipart/alternative; boundary="0000000000009f67e30599ffe208"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, "Pine,
 Kathryn ElaineX" <kathryn.elainex.pine@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000009f67e30599ffe208
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2019 at 7:02 AM vishwa <vishwa@linux.vnet.ibm.com> wrote:

> Hello community,
>
> Would be really great if there is any feedback on this.
>
> Have a happy holidays !!
>
> !! Vishwa !!
> On 12/11/19 3:24 PM, vishwa wrote:
>
> On 12/11/19 12:17 AM, Pine, Kathryn ElaineX wrote:
>
> >* Do we need this going forward ?*: I am being asked by UX team about
> the need of this and I mentioned I would get the community feedback on
> this. Although, I feel this level of granularity gives control over how w=
e
> can manage time, it would not justify the complexity if the customers don=
't
> appreciate it. Removing the TimeOwner would make the code a lot simpler.
>
> Hi,
>
>
>
> I am coming from the UX side of how we set the date time settings page up
> for phosphor-webui downstream recently. We switched our page to use
> Redfish, here=E2=80=99s how ours is set up now:
>
>
>
> There is no longer a =E2=80=9Ctime owner=E2=80=9D and the setting is eith=
er:
>
> NTPEnabled: true or false
>
> If false, we are not allowing the user to set the time, because the BMC i=
s
> synching from the host time and therefore any settings we made to the tim=
e
> on the BMC would be overwritten.
>
> If true, we use the NTP server(s) the user provides.
>
>
>
> We are testing this currently.
>
>
> Hi, Thank you for the response. From what I interpreted:
>
> - TimeOwner is not settable via GUI
> - Irrespective of NTP setting, the user is not allowed to set the time on
> BMC
> - BMC is syncing the time from Host.
>    - This means, the current TimeOwner is "Host" and NTP is off. Is that
> being set as default ?
>
> I am requesting for feedback from the community on the need of TimeOwner
> feature that we have in Settings and timemanager code.
>
> !! Vishwa !!
>
> My 2cents here along with a few questions:
- how does the current time manager interact with systemd-timesyncd?
- From my experience, BMC time can drift a lot easily and it is more useful
to have the BMC time synced externally
- Whether NTP or host time is preferred should be left to the platform
designer to decide
- sounds like it would be more straightforward to have the 'Owner' reflect
one time source: NTP/IPMI/Redfish

--=20
Regards,
Kun

--0000000000009f67e30599ffe208
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 18, 2019 at 7:02 AM vishw=
a &lt;<a href=3D"mailto:vishwa@linux.vnet.ibm.com" target=3D"_blank">vishwa=
@linux.vnet.ibm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF">
    <p>Hello community,<br>
    </p>
    <p>Would be really great if there is any feedback on this.</p>
    <p>Have a happy holidays !!<br>
    </p>
    <p>!! Vishwa !!</p>
    <div>On 12/11/19 3:24 PM, vishwa wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div>On 12/11/19 12:17 AM, Pine, Kathryn
        ElaineX wrote:<br>
      </div>
      <blockquote type=3D"cite">
       =20
       =20
       =20
        <div>
          <p><span style=3D"color:windowtext">&gt;</span><b> Do we need
              this going forward ?</b>: I am being asked by UX team
            about the need of this and I mentioned I would get the
            community feedback on this. Although, I feel this level of
            granularity gives control over how we can manage time, it
            would not justify the complexity if the customers don&#39;t
            appreciate it. Removing the TimeOwner would make the code a
            lot simpler.<u></u><u></u></p>
          <p class=3D"MsoNormal"><span style=3D"color:windowtext">Hi,<u></u=
><u></u></span></p>
          <p class=3D"MsoNormal"><span style=3D"color:windowtext"><u></u>=
=C2=A0<u></u></span></p>
          <p class=3D"MsoNormal"><span style=3D"color:windowtext">I am
              coming from the UX side of how we set the date time
              settings page up for phosphor-webui downstream recently.
              We switched our page to use Redfish, here=E2=80=99s how ours =
is
              set up now:<u></u><u></u></span></p>
          <p class=3D"MsoNormal"><span style=3D"color:windowtext"><u></u>=
=C2=A0<u></u></span></p>
          <p class=3D"MsoNormal"><span style=3D"color:windowtext">There is
              no longer a =E2=80=9Ctime owner=E2=80=9D and the setting is e=
ither:<u></u><u></u></span></p>
          <p class=3D"MsoNormal"><span style=3D"color:windowtext">NTPEnable=
d:
              true or false<u></u><u></u></span></p>
          <p class=3D"MsoNormal"><span style=3D"color:windowtext">If false,
              we are not allowing the user to set the time, because the
              BMC is synching from the host time and therefore any
              settings we made to the time on the BMC would be
              overwritten. <u></u><u></u></span></p>
          <p class=3D"MsoNormal"><span style=3D"color:windowtext">If true,
              we use the NTP server(s) the user provides.<u></u><u></u></sp=
an></p>
          <p class=3D"MsoNormal"><span style=3D"color:windowtext"><u></u>=
=C2=A0<u></u></span></p>
          <p class=3D"MsoNormal"><span style=3D"color:windowtext">We are
              testing this currently.</span></p>
        </div>
      </blockquote>
      <div><br>
        Hi, Thank you for the response. From what I interpreted:<br>
        <br>
      </div>
      <div>- TimeOwner is not settable via GUI<br>
        - Irrespective of NTP setting, the user is not allowed to set
        the time on BMC<br>
        - BMC is syncing the time from Host.<br>
        =C2=A0=C2=A0 - This means, the current TimeOwner is &quot;Host&quot=
; and NTP is off.
        Is that being set as default ?<br>
      </div>
      <div><br>
        I am requesting for feedback from the community on the need of
        TimeOwner feature that we have in Settings and timemanager code.<br=
>
      </div>
      <div><br>
        !! Vishwa !!<br>
      </div>
      <blockquote type=3D"cite">
        <div>
          <p class=3D"MsoNormal"><span style=3D"color:windowtext"><a name=
=3D"m_-4131239486451252847_m_691753059126936336______replyseparator"></a><u=
></u><u></u></span></p>
        </div>
      </blockquote>
    </blockquote>
  </div>

</blockquote></div>My 2cents here along with a few questions:<div>- how doe=
s the current time manager interact with=C2=A0systemd-timesyncd?<br><div>- =
From my experience, BMC time can drift a lot easily and it=C2=A0is more use=
ful to have the BMC time synced externally</div><div>- Whether NTP or host =
time is preferred should be left to the platform designer to decide</div><d=
iv>- sounds like it would be more straightforward to have the &#39;Owner&#3=
9; reflect one time source: NTP/IPMI/Redfish<br clear=3D"all"><div><br></di=
v>-- <br><div dir=3D"ltr"><div dir=3D"ltr">Regards,<div>Kun</div></div></di=
v></div></div></div>

--0000000000009f67e30599ffe208--
