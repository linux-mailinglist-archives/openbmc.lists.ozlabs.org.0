Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A15E289CD4
	for <lists+openbmc@lfdr.de>; Sat, 10 Oct 2020 02:58:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C7RPj4By6zDqs8
	for <lists+openbmc@lfdr.de>; Sat, 10 Oct 2020 11:58:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::333;
 helo=mail-ot1-x333.google.com; envelope-from=ztai@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=pDEaIEPv; dkim-atps=neutral
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C7RP33752zDqs3
 for <openbmc@lists.ozlabs.org>; Sat, 10 Oct 2020 11:57:23 +1100 (AEDT)
Received: by mail-ot1-x333.google.com with SMTP id m13so10605145otl.9
 for <openbmc@lists.ozlabs.org>; Fri, 09 Oct 2020 17:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=zdYc75A6660DkMV/iLpPA8L1nkWFqQ7g+x9xvqHZysY=;
 b=pDEaIEPv2cutB57EYtteI/8zbuKAkcIb3fMLDqJNpGP3FN7JPZzbxkd/Zf6LDDSxmk
 2TcXtbccmj8i4NafuVg2TKUML/6co5R2yFCV/c2r+K7FVeP72HDGAlzauEDtbgDM/r0X
 TP74DPBi8nEzp1zVq68uyAKGDFIAbxWrsee5rQ2/RT7o887tGv9WEc6Cn8fBWDS7kLv5
 CGf8djv0TZ0hOtmbJwfxO/936XPdmtvWD/VDzwlbHV0IvjakIqBhUM6Mcp0d/uYr/DyC
 wUQGutfUEaEE9plZTqO0hO9dwylEp+WWKhIvGIHolefTBEwXNd2hv8TxKNTnCu1J7iKt
 vLFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=zdYc75A6660DkMV/iLpPA8L1nkWFqQ7g+x9xvqHZysY=;
 b=O46bbQaoUbXeidD4H3U+IxxxlLKA4jUDLi6hyWaO4a0aUpnXnwOqa6KEe9CY20rKxb
 SF5J0iDhMq68sN02qZFXCPeqRwIoX9X+AWAwHt68ZiVTTr4tw7Es43yrZjZlMwohEp6n
 PdjFyB6u025DQuDF6zdZ+nhULP34dIJDom/5Pxw2gId9CQ84za06cz1QuzaCeQeSFSHC
 Cb9N+LPCJLLUdMq0O9kChvzEHM2Uh0+tDEfYxnYwQh0gUkbiWT1Mn0n/145DmK/92aok
 pv/+i2ozNY2SLz6ezQVUonnjhjzUfG2rOUAWIS6wGyb0pDXxhKY2GL5MxQ92Owyow+OX
 Yu7w==
X-Gm-Message-State: AOAM5314dXlMmfjL5RcvU+1WPP3o2+UfXg/csPGisuNV7K8MDdRr0BCg
 jIZnAliyfssSCyaShJpao/2uoFRcJIM+S5KrzEDbzmIIBU60nw==
X-Google-Smtp-Source: ABdhPJxTQzpfDJSBvRmJjlvHtk9Nr5m7Mt319ByLSFzXlQchSSp5QQKZ4eFJPbijyDNW6brs0xxbcP2tvSkXQ9hS2i4=
X-Received: by 2002:a9d:4587:: with SMTP id x7mr10660795ote.222.1602291440019; 
 Fri, 09 Oct 2020 17:57:20 -0700 (PDT)
MIME-Version: 1.0
From: Zhenfei Tai <ztai@google.com>
Date: Fri, 9 Oct 2020 17:57:09 -0700
Message-ID: <CAMXw96NCuqbeaOMQaO_BU2+_qQojOfLQdH-1=JS16vfanSZPdw@mail.gmail.com>
Subject: [redfish/v1/Systems/system/Processors] How does it work on wolf pass?
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000001c55c105b1468c18"
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
Cc: Ed Tanous <ed@tanous.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000001c55c105b1468c18
Content-Type: text/plain; charset="UTF-8"

Hi,

I've been testing bmcweb and noticed the response from the URI
`redfish/v1/Systems/system/Processors` contains an empty collection.

{
  "@odata.context":
"/redfish/v1/$metadata#ProcessorCollection.ProcessorCollection",
  "@odata.id": "/redfish/v1/Systems/system/Processors/",
  "@odata.type": "#ProcessorCollection.ProcessorCollection",
  "Members": [],
  "Members@odata.count": 0,
  "Name": "Processor Collection"
}

Looking at bmcweb code, it seems to look for dbus interfaces
`xyz.openbmc_project.Inventory.Item.Cpu` and
`xyz.openbmc_project.Inventory.Item.Accelerator`. However they can't be
seen in dbus.

# busctl tree --no-pager xyz.openbmc_project.Inventory.Item.Cpu
Failed to introspect object / of service
xyz.openbmc_project.Inventory.Item.Cpu: The name is not activatable

Entity-manager and cpu-sensor are running in addition to bmcweb. The
entity-manager config is below and I can see the config is picked up in
`xyz.openbmc_project.EntityManager`.

{
  "Exposes": [
    {
        "Address": "0x30",
        "Bus": 0,
        "CpuID": 1,
        "Name": "CPU 1",
        "Type": "XeonCPU"
    },
    {
        "Address": "0x31",
        "Bus": 0,
        "CpuID": 2,
        "Name": "CPU 2",
        "Type": "XeonCPU"
    }
  ],
  "Name": "internal_code_name",
  "Probe": "xyz.openbmc_project.FruDevice({'BOARD_PRODUCT_NAME':
'internal_product_name'})",
  "Type": "Board"
}

I'm not sure what else is required to have the URI work properly. Could
someone familiar with this issue help?

Thanks,
Zhenfei

--0000000000001c55c105b1468c18
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br><div><br></div><div>I&#39;ve been testing bmcweb an=
d noticed the response from the URI `redfish/v1/Systems/system/Processors` =
contains an empty collection.</div><div><br></div><div><font color=3D"#0000=
ff">{<br>=C2=A0 &quot;@odata.context&quot;: &quot;/redfish/v1/$metadata#Pro=
cessorCollection.ProcessorCollection&quot;,<br>=C2=A0 &quot;@<a href=3D"htt=
p://odata.id">odata.id</a>&quot;: &quot;/redfish/v1/Systems/system/Processo=
rs/&quot;,<br>=C2=A0 &quot;@odata.type&quot;: &quot;#ProcessorCollection.Pr=
ocessorCollection&quot;,<br>=C2=A0 &quot;Members&quot;: [],<br>=C2=A0 &quot=
;Members@odata.count&quot;: 0,<br>=C2=A0 &quot;Name&quot;: &quot;Processor =
Collection&quot;<br>}</font><br></div><div><br></div><div>Looking at bmcweb=
 code, it seems to look for dbus interfaces `xyz.openbmc_project.Inventory.=
Item.Cpu` and `xyz.openbmc_project.Inventory.Item.Accelerator`. However the=
y can&#39;t be seen in dbus.</div><div><br></div><div><font color=3D"#0000f=
f"># busctl tree --no-pager xyz.openbmc_project.Inventory.Item.Cpu<br>Faile=
d to introspect object / of service xyz.openbmc_project.Inventory.Item.Cpu:=
 The name is not activatable</font><br></div><div><br></div><div>Entity-man=
ager and cpu-sensor are running in addition to bmcweb. The entity-manager c=
onfig is below and I can see the config is picked up in `xyz.openbmc_projec=
t.EntityManager`.</div><div><br></div><div><font color=3D"#0000ff">{<br>=C2=
=A0 &quot;Exposes&quot;: [<br>=C2=A0 =C2=A0 {<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;Address&quot;: &quot;0x30&quot;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
quot;Bus&quot;: 0,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;CpuID&quot;: 1,<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Name&quot;: &quot;CPU 1&quot;,<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &quot;Type&quot;: &quot;XeonCPU&quot;<br>=C2=A0 =C2=A0=
 },<br>=C2=A0 =C2=A0 {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Address&quot;: =
&quot;0x31&quot;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Bus&quot;: 0,<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;CpuID&quot;: 2,<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;Name&quot;: &quot;CPU 2&quot;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 &qu=
ot;Type&quot;: &quot;XeonCPU&quot;<br>=C2=A0 =C2=A0 }<br>=C2=A0 ],<br>=C2=
=A0 &quot;Name&quot;: &quot;internal_code_name&quot;,<br>=C2=A0 &quot;Probe=
&quot;: &quot;xyz.openbmc_project.FruDevice({&#39;BOARD_PRODUCT_NAME&#39;: =
&#39;internal_product_name&#39;})&quot;,<br>=C2=A0 &quot;Type&quot;: &quot;=
Board&quot;<br>}</font><br></div><div><font color=3D"#0000ff"><br></font></=
div><div><font color=3D"#000000">I&#39;m not sure what else is required to =
have the URI work properly. Could someone familiar with this issue help?</f=
ont></div><div><font color=3D"#000000"><br></font></div><div><font color=3D=
"#000000">Thanks,</font></div><div><font color=3D"#000000">Zhenfei</font></=
div></div>

--0000000000001c55c105b1468c18--
